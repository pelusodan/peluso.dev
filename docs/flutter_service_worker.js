'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "76d9431a0ea91675680713fda0d3f935",
"assets/AssetManifest.bin.json": "f9c26be0171cd7db2c50ce2ad77682f5",
"assets/AssetManifest.json": "ceb0a567abce539b3e7b10e704ad1fd6",
"assets/assets/doc/resume.pdf": "c96469c8ff0f2999a0df6667af4ea7f8",
"assets/assets/img/austin.png": "2ecff97773815a007356592c969366ff",
"assets/assets/img/cv.png": "18348f12ec692e597e27601be0b86113",
"assets/assets/img/daffy.gif": "551d8cff4dbb14ae2976eae6462022cc",
"assets/assets/img/droidcon.jpg": "b1d0d56aa987eedb9d0387f55808b70a",
"assets/assets/img/droidcon2.jpg": "00bc1e9dea215c701f664c02c342cd44",
"assets/assets/img/droidcon3.jpg": "89fb32d66794b9f97ba7e8e6cebf4519",
"assets/assets/img/feed.png": "706bbd52b1b3b6b9b9a73b35780ac5ac",
"assets/assets/img/flutterWeb.jpg": "7efb97550c50d5cffcd5401c0480ee01",
"assets/assets/img/fridgePal.png": "f7715c9bbe5aae9747d94752fd301243",
"assets/assets/img/header_dan.png": "0596c3d9ae4af8f871d50004a29f1299",
"assets/assets/img/kanestheticLearning.png": "5c049187833fa5b7b6437edb5eb66cf0",
"assets/assets/img/klaviyo.png": "00875adf7c7db8006a49bcb142a44f1b",
"assets/assets/img/mature.png": "3e4c0112544beea2d9654c56efb4794b",
"assets/assets/img/missMyTrain.png": "142af3bf5e8ce703631ef15248670207",
"assets/assets/img/neu.png": "85015b0ab8a2568af74eff58f40903db",
"assets/assets/img/old_school_profile.jpg": "8deda284f1742bfbd34cec7a63af3efa",
"assets/assets/img/peloton.png": "259e6c6e2aa96b2b9b653edf58f3019c",
"assets/assets/img/pison.png": "45d31c0160c00529d8f238800baf215a",
"assets/assets/img/pokemon.png": "d32e3559e0aad95146bdeeba360d951e",
"assets/assets/img/walletGuru.png": "60e0e5ee8e965fddc9a4492c62c61a82",
"assets/assets/img/wallet_guru.png": "60e0e5ee8e965fddc9a4492c62c61a82",
"assets/assets/img/whoop.png": "4e1c0e66e04f276408ddd413015a9d48",
"assets/FontManifest.json": "875104f8b67c4340996c4b6b47b72223",
"assets/fonts/Blockstepped.ttf": "894bfc18e8fd1529415d43a891d78b31",
"assets/fonts/MaterialIcons-Regular.otf": "06c146e5f769d48c17c95351e97a9975",
"assets/NOTICES": "359829edd5cde246b3a2ddfb33b989f0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter95/icons/icon_error.png": "19c2cb293b0cd882f62109b585d5e1b4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "1fe526163e8ee2932b100a259fa4d909",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "c1f7bee6dc88bb2f86e340540e6c9c6b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "64ecb2bd0f2860faeedc699ed9ef26d3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "6faa5a17b2bde16837571c73196edc0f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a882bc344b1d4c60152731f58d477813",
"/": "a882bc344b1d4c60152731f58d477813",
"main.dart.js": "f9205b3a83ab956cff1fcace2ee24ba9",
"manifest.json": "b140fcd94c3bde89d88baedb38b71212",
"version.json": "1633bc80f3ba3e87235ea58b8de8dd9e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
