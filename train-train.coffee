scene = new THREE.Scene()
camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
renderer.setClearColor(0xcceeff, 1)
document.body.appendChild(renderer.domElement)

light = new THREE.AmbientLight( 0x505050 )
scene.add( light )

directionalLight = new THREE.DirectionalLight( 0xffffff, 0.5 )
directionalLight.position.set( 0, 100, 50 )
scene.add( directionalLight )

geometry = new THREE.PlaneGeometry( 50, 50 )
material = new THREE.MeshLambertMaterial( {color: 0x703000} )
ground = new THREE.Mesh( geometry, material )
ground.rotation.x = Math.PI / -2;
scene.add( ground )

geometry = new THREE.CubeGeometry(3, 1, 1)
material = new THREE.MeshLambertMaterial({color: 0x777777, transparent: true, opacity: 0.5})
train = new THREE.Mesh(geometry, material)
train.position.set(0, 0.5, 0)
scene.add(train)

geometry = new THREE.CubeGeometry(3, 5, 5)
material = new THREE.MeshLambertMaterial({color: 0xffffff})
building = new THREE.Mesh(geometry, material)
building.position.set(0, 0.5, -5)
scene.add(building)

camera.position.set(0, 2, 5)

render = () ->
  requestAnimationFrame(render)
  renderer.render(scene, camera)

render()
