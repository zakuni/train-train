scene = new THREE.Scene()
camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
renderer.setClearColor(0xcceeff, 1)
document.body.appendChild(renderer.domElement)

geometry = new THREE.PlaneGeometry( 50, 50 )
material = new THREE.MeshBasicMaterial( {color: 0xdddddd, side: THREE.DoubleSide} )
ground = new THREE.Mesh( geometry, material )
ground.rotation.x = Math.PI / -2;
scene.add( ground )

geometry = new THREE.CubeGeometry(3, 1, 1)
material = new THREE.MeshBasicMaterial({color: 0x777777})
train = new THREE.Mesh(geometry, material)
train.position.set(0, 0.5, 0)
scene.add(train)

camera.position.set(0, 2, 5)

render = () ->
  requestAnimationFrame(render)
  renderer.render(scene, camera)

render()
