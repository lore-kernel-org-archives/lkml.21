Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466467;
	b=kFMkicbDI8zbxDy1gqCqzMO/4wlAIeEdT6WNt3d3sWA5uebLBDnVyyQMaMATRokVoY0v
	 9Au6h2wpOqZnMWT6LNFHE3Sl9xNgfiQoJp5iSKvW8Hgp8mcN0Ka93F2NaFIVfnJERzhVX
	 zoYad3NxI7NxePEjEy+ECZl24ulw89AyW6B9GqhpIqyIc8WGYls2vpNRwt55O8gWDvRg3
	 6sm//UjtAqrVxFsNnhz4od/kkO6oqE96ARPpDjDDgQlcWDy/92XUDqzXmFcrTGhPm71ij
	 vweHa17z8l2irawbUrIdmNXJCVZ4WtO7n5tfgZDEPi0Xa6YNRtnKSLOSsDDsPmW9oUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466467;
	h=Received:DKIM-Signature:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=I1czp7PqVLxquiOija712n/ujGVbgtxIGbDmWhDuny4=;
	b=vKxzN6tiSGPAdRzu/oaekXHIwZ3gFo1inejLWn+z2gh+Rxho1roave+KDwBYyrX88pDN
	 bEExeiYAPfRW2DBKl7IprapRpT12ySHtkk4AkMbv2fbpVFPsH9Jf2LfNm9ihuyxVhUrW2
	 eEuSsVXdPpwC8ak6iMicpjABbIRQTKvMi8Pa0im7RXIPr1R2TfLMXvapMTaTdPDDXeZfY
	 G8jRfBYnHXT+SQT7JH8z3Org8lKlvA39YEmJ7jeAcqq1faQgC1upLeZoHMoynIgqM91uN
	 ptWouvRpHZTO02HiM8xp4F+aPxCqpAOq6SQN++bSlRQ7g7A8H998K+ih/WW7yAshl7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jy1Xi+yi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C8606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jy1Xi+yi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8093D1F000C6;
	Mon, 23 Nov 2026 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466467;
	bh=I1czp7PqVLxquiOija712n/ujGVbgtxIGbDmWhDuny4=;
	h=Date:From:To:cc:Subject;
	b=Jy1Xi+yiqETjKlLWPVwBejhxKNj/5+su5WzPEnYYEmgK/jxzG29NKdFsIlLWP1LtQ
	 aY3cfKbu4Ols67L1BWC0oVho7lkuoNBO/fFEOP52dcnp0M/IW87swyx/BBWgh+uWhN
	 CEs0o1hnvyxcg9uRSEM+OTXOwvfCUL10/Ib8/0KWcSKrI4Ke7hzWq+RvHafRs7X9Sr
	 e5ApeEFTr5DlziC0tmeSdOjprU6ly5mQ4bsvE3xHmgg1aUoJ8wq3k5H1cB2Qpq4J1W
	 UhIDlO/x4P4maEblchuXRdQH0Lg/vHVKNV/s1d7FUdsbx65SSXB++CYMSNDo6IYFC9
	 95nndl5WyJ+Yw==
Date: Mon, 23 Nov 2026 21:41:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] HID fixes for 7.4
Message-ID: <019pr649-8s0o-np46-4p81-2805n9n9q54q@xreary.bet>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-li=
nus-2026112301

to receive HID susbsytem fixes queue that should land in 7.4.

The amount of patches is slightly higher than I'd like to see for -rc4,=20
and there are two reasons for it -- the amount of patches is much higher=20
overall, due to all the AI fixes coming to the driver land, and both=20
myself and Benjamin have been pretty much unable to process incoming=20
patches for a past couple weeks for various reasons; but we're getting=20
back on track.

You are going to get trivial merge conflict between

  4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmall=
oc_obj() family")

and

  ac6c19392c799 ("HID: sensor: custom: Fix state lifetime during removal")

as the fixes branch has been based on older base, but it's trivial to fix=
=20
(just use plain kzalloc()), but I can prepare a branch with the resolution=
=20
if preferred.

=3D=3D=3D=3D=3D
Mostly functional code fixes all over the place, plus a few new device IDs=
=20
support.
=3D=3D=3D=3D=3D

Thanks.

----------------------------------------------------------------
Aldo Ariel Panzardo (2):
      HID: wacom: validate battery range before scaling
      HID: wacom: avoid divide exception in dropped-packet calculation

Andreas Claesson (1):
      HID: corsair: cancel LED work again after unregistering the LED

Danish Khateeb (1):
      HID: corsair: use disable_work_sync() to tear down the LED workers

David Cemin (1):
      HID: asus: map Consumer brightness usages on I2C keyboards

Devarjya Purkayastha (1):
      HID: wacom: Prevent NULL dereference in wireless work

Dmitry Antipov (3):
      HID: roccat: use atomic_t for device status flag
      HID: roccat: use kref to manage device instances
      HID: roccat: avoid unlocked report buffer access in roccat_poll()

Eren =C7akar (1):
      HID: letsketch: skip string descriptors the firmware does not impleme=
nt

Hans de Goede (1):
      HID: lenovo: suppress spurious F23 key events on ThinkPad T14s gen6/7=
 snapdragon

Hans van Essen (1):
      HID: asus: Resume the device before sending feature reports

HyeongJun An (1):
      HID: intel-thc-hid: intel-quickspi: validate GET REPORT response size

Ignacio Mart=EDn Arano (1):
      HID: apple: Add "F108Pro Dongle" to the list of non-apple keyboards

Jianjun Lang (1):
      HID: steelseries: Add MSI Raider A18 HX A7VHG to RGB DMI table

Jinmo Yang (1):
      HID: wiimote: initialise rumble_worker once per device

Jozef Riha (1):
      HID: betop: add support for SPEEDLINK TORID

Krish Gulati (1):
      HID: core: serialize report_descriptor_read() against probe and remov=
e

Lu Huang (1):
      HID: nintendo: fix lost update of player LED state

Lukasz Leczkowski (1):
      HID: quirks: add ALWAYS_POLL for ASUS ProArt MD301 mouse

Mathias Krause (1):
      HID: Intel-thc-hid: Fix REGMAP dependency

Michael Schwarz (1):
      HID: logitech-dj: Add support for G915 receiver 0xc541

Muhammed Sariyildiz (1):
      HID: multitouch: Preserve class quirks when inverting orientation

Myeonghun Pak (1):
      HID: magicmouse: disable the multitouch work on removal

Nguyen Ngoc Thang (1):
      HID: saitek: don't dereference a NULL hidinput in saitek_event()

Ping Cheng (1):
      HID: wacom: Access shared touch input by rcu_dereference()

Sang-Hoon Choi (1):
      HID: nintendo: release the player ID when LED setup fails

Sanjay Govind (1):
      HID: sony: fix sleeping in atomic context in RB3 Pro raw event handle=
r

Shashikirana H K (1):
      HID: vivaldi: Extract feature report value directly in vivaldi_featur=
e_mapping()

Srinivas Pandruvada (7):
      HID: sensor-hub: Synchronize callback removal with raw events
      HID: sensor: custom: Set owner for misc device
      HID: sensor: custom: Disable sensor before hub close on removal
      HID: sensor: custom: Fix state lifetime during removal
      HID: sensor: custom: Serialize misc device reads
      HID: sensor: custom: Register enable attribute after misc device
      HID: sensor-hub: Remove clients before stopping hardware

Vicki Pfau (3):
      HID: nintendo-switch2-usb: Fix potential deadlock on teardown
      HID: nintendo-switch2-usb: Improve shutdown logic with inbound messag=
e work
      HID: nintendo-switch2-usb: Clean up urb in probe error path

Viktor Sharha (1):
      HID: quirks: add ALWAYS_POLL quirk for Keychron Link receiver

Waqar Gulzar (1):
      HID: i2c-hid-acpi: restore touchscreen IRQ routing on HP OmniBook Fli=
p laptops

Zhengping Jiang (1):
      HID: vivaldi: avoid redundant feature report reads per usage

 drivers/hid/hid-apple.c                            |   1 +
 drivers/hid/hid-asus.c                             |  14 ++-
 drivers/hid/hid-betopff.c                          |   4 +
 drivers/hid/hid-core.c                             |   2 +
 drivers/hid/hid-corsair.c                          |  10 +-
 drivers/hid/hid-ids.h                              |   6 ++
 drivers/hid/hid-lenovo.c                           |  21 ++++
 drivers/hid/hid-letsketch.c                        |  21 +++-
 drivers/hid/hid-logitech-dj.c                      |   4 +
 drivers/hid/hid-magicmouse.c                       |   2 +-
 drivers/hid/hid-multitouch.c                       |   2 +-
 drivers/hid/hid-nintendo-switch2-usb.c             |  18 ++--
 drivers/hid/hid-nintendo.c                         |  13 +--
 drivers/hid/hid-picolcd.h                          |   2 +
 drivers/hid/hid-quirks.c                           |   3 +
 drivers/hid/hid-roccat.c                           |  59 ++++++----
 drivers/hid/hid-saitek.c                           |   7 +-
 drivers/hid/hid-sensor-custom.c                    | 119 +++++++++++++++--=
----
 drivers/hid/hid-sensor-hub.c                       |  27 ++++-
 drivers/hid/hid-sony.c                             |  13 +--
 drivers/hid/hid-steelseries.c                      |   7 ++
 drivers/hid/hid-vivaldi-common.c                   |  87 +++++++--------
 drivers/hid/hid-wiimote-core.c                     |   1 +
 drivers/hid/hid-wiimote-modules.c                  |   5 +-
 drivers/hid/hid-wiimote.h                          |   1 +
 drivers/hid/i2c-hid/i2c-hid-acpi.c                 |  65 +++++++++++
 drivers/hid/intel-thc-hid/Kconfig                  |   1 +
 .../intel-thc-hid/intel-quickspi/pci-quickspi.c    |  16 +--
 .../intel-thc-hid/intel-quickspi/quickspi-dev.h    |   1 +
 .../intel-quickspi/quickspi-protocol.c             |  12 ++-
 drivers/hid/wacom_sys.c                            |   2 +-
 drivers/hid/wacom_wac.c                            |  41 +++++--
 32 files changed, 421 insertions(+), 166 deletions(-)

--=20
Jiri Kosina
SUSE Labs

