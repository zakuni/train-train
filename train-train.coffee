scene = new THREE.Scene()
camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)
camera.inside = true
camera.position.set(0, 1, 1)

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
renderer.setClearColor(0xcceeff, 1)
renderer.shadowMapEnabled = true
document.body.appendChild(renderer.domElement)

light = new THREE.AmbientLight( 0x808080 )
scene.add( light )

directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 )
directionalLight.position.set( 0, 100, 50 )
directionalLight.castShadow = true
scene.add( directionalLight )

geometry = new THREE.PlaneGeometry( 50, 50 )
material = new THREE.MeshLambertMaterial( {color: 0x703000} )
ground = new THREE.Mesh( geometry, material )
ground.rotation.x = Math.PI / -2
ground.receiveShadow = true
scene.add( ground )

geometry = new THREE.CubeGeometry(3, 1, 1)
material = new THREE.MeshLambertMaterial({color: 0xeeeeff, transparent: true, opacity: 0.1})
train = new THREE.Mesh(geometry, material)
train.position.set(0, 0.5, 0)
train.castShadow = true
scene.add(train)

geometry = new THREE.CubeGeometry(3, 5, 5)
material = new THREE.MeshLambertMaterial({color: 0xffffff})
building = new THREE.Mesh(geometry, material)
building.position.set(0, 2.5, -5)
building.castShadow = true
building.receiveShadow = true
scene.add(building)

document.addEventListener("keydown", (e)->
  keyCode = e.which
  if keyCode is 32 #space key
  else if keyCode is 67 #c
    if camera.inside
      camera.position.set(0, 8, 12)
    else
      camera.position.set(0, 1, 1)
    camera.inside = !camera.inside
  else if keyCode is 68 #d
    toggleDebugMode()
, false)

toggleDebugMode = ->
  directionalLight.shadowCameraVisible = !directionalLight.shadowCameraVisible

render = () ->
  requestAnimationFrame(render)
  train.position.x += 0.1
  renderer.render(scene, camera)

render()
