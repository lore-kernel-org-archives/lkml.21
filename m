Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029715;
	b=edpSZtpZgg70kPaNqDLTab12NYqChN+TTJNYRohNKpXPIEhbOYqwm+hUBxPnorDNRcCD
	 JpTh801iaVeFuRNfLQA5VTa4IVUTd6v2BgXqtrw4/WznmufWoqwSou0I/Ux9kgKz66NQ0
	 vQOWdmIcy79/dR6flQsuBv0Pc5dVCP9kfHV68PU4ObcvBCYUtOSYNk6n+HRlhpW4hWABJ
	 pNVTDDau9ItW2vzfxEM5W4XmTqWHtraNn2hVcAdi92QAxO8GE39t4jI4J9czQXfpca09Y
	 Cbnlf9htoPmlX5eg/sUQ6YddU6080IXjpHcmuUQlNhLJOE2vPAuVL3q/yCernwmSH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XfCY0YxI9o+32ShywolfpfCq150S3JR8ZD2syCrWnV8=;
	b=uWtvV1xJ097IXBN/nG4+cuEqWiFCUsIwxPAxTH7g6/2pmXZgqTHqDRuEL50LjDiTFuCI
	 70inwD/POGD/NUthdj3xMs+3wA7nMkUUkW8svib4Qji+nlgx9iMtqzrTBJjLwaMd+AsU7
	 a4kOwA2j4ncF2DpfR8XOXzJdFyDM9+FKgPvq3afWAVvEzNu9RaFfsF8RrLy6JE2J8uWkz
	 2kH0FMiojR440fIt/6oHyLEHP6iJeaoomKyDdQWHodSkHLbc/mO9oNbOp8LdyOhrwMgfM
	 KvuFi35zuzyaArKl9R9INdR9E1ENDxVJiTK+Bl3zYslCtN3LsxHPOIv3K7qi1UFT0yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XhG0kODF;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B583B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XhG0kODF
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-705cb6ceebaso1172147eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029714; x=1795634514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XfCY0YxI9o+32ShywolfpfCq150S3JR8ZD2syCrWnV8=;
        b=XhG0kODFgIge3YT+uZxRbeQzqh5GLCJcI/501iQVfQWj40icyssFW7nIYWTsFSffS2
         JuIFYivkc8vYpm8+IZbNOwGc8HCLG7Dk97i+8wbREkqj0NINQi1x4ATn/BFbFlKFqtUR
         xyDZsleZqBOGl1dpG45l+Qh0OeXEv09/xsiikHAk7Pp/WAyHRkalGzTPy4cV7wQIW5nM
         /zfh6MZeSeJFGyvRhybjl9wD4VSbpIitxu2IpG2VNy6RVLzJvaXyScI0as82LV5uP/cZ
         O+pYgFvL5fzZwnLlvXIFXdvqVn0GF8qEec7udxXO3h2f3D19RVarzgqynbGxSvQzJ46u
         hkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029714; x=1795634514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfCY0YxI9o+32ShywolfpfCq150S3JR8ZD2syCrWnV8=;
        b=1Ezsyg44bz3NwOEWTDiT7hUCZKLzsMsw0+7uaeI4E1hVf4fwRhekXNJ8q0V4UuPuTg
         iMStKHXtIHKvv4W0bgGf+d+xJ183wKwpy/Ma55c3J5N9k3o3z57IJh0VyX1jq2rw1gXA
         06r4qkbP0YMf3Z5WLh4ies4xRzUKBvCP1JPpzBMowgg++rDoWtWscHVSbYXPl7phd3BX
         y7WWinheSdRNw6aysi5t7tMExLrK7kToM/nmq4TYeYWTXCaiZ76/DDS/KtAra1YU8GQA
         rafVFqZKQWf7jA+j+vioKMO/RluYbDSIWm5ASDBqgLZ4G0uHbIID9H7HdYZAfgeyb+Jt
         U95A==
X-Gm-Message-State: APuU4Z8S1J104SStY9cM0uXX//9EBm09nPpyLWw8iS81YlFOSXUXlnQi
	bCvYGPbaTobkxNRZbIckZWw6stByb6HaYVg27i0lm9DFOmE4MlfMJJI=
X-Gm-Gg: AYBFou046JTugXuGh1LunRtW/2lq04nY2w//5EUAhbHhgcmr3ql6VWPyxNr/EqcQgss
	191/zy+FMAmgWYKT+pmLfHE2IKuv+G8F1bSM8ObZdfoxsAI0YXDWmU3TnCSg+B24ICvqXxWbnOq
	ySfARMOb67BoyIvUPJhUakv5jZ8AuFKwq7cjuMuM+p+VJIDHwXREEJZeIFmAvx159MH7OH1a2eY
	mKmTnwfjhBZw2QDsqoTReD3v1w3XkZBujjH8UTXRb5BMtxfCm1WKtuFREnH9qdOc+nkopmYT3YR
	dG48wnOavB3V49UlKoWHjCRSBDw9dC/fTtmKhG+B1S1kWY9trcb03rcBFmfL5FVEzGQDY16/M2P
	RNydt8ZC3ME1zPXgs497oJpHbDpo6Ezd3mPd6WO7wKR6p99lEHl7OT5tdZjq2W0QNbhEpfsV3Gs
	03p4R7zPLJ1pD0a9Vbsi/S5IwYn6Jhd8Ct6OIK69ToHzXnkMnMhEFhMrmDH6qdE1sOO40GEAj2V
	6AIVDoAin6OOXC49aBJk1jlUZ3BbuuJNVR4AZ9ZN60jOfq8d9Gy62KKz28ovrKYyir6YroF8d/Z
	mglVXEh1UfB3iKiQOSQbFqgMiNYqPCQKAgBTWhv0/mHJoYhiR1v/UH2p
X-Received: by 2002:a05:6820:c5d4:10b0:71a:fb85:d063 with SMTP id 006d021491bc7-71b18618ca9mr2045803eaf.80.1795029713272;
        Wed, 18 Nov 2026 11:21:53 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:21:52 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 0/8] Add driver for StarTech USB3HDCAP capture device
Date: Wed, 18 Nov 2026 13:21:16 -0600
Message-ID: <20261118192124.23330-1-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a V4L2/ALSA driver for the StarTech USB3HDCAP (and Micomsoft
XCAPTURE-1 variant), a USB 3.0 video capture device based on the
MST3367 HDMI receiver, TW9900 composite decoder, and CS53L21 audio codec.

The driver supports composite, S-Video, component, and HDMI inputs,
including audio capture.

Tested on all four inputs at various resolutions. All v4l2-compliance
tests pass, including streaming tests, with these two v4l2-compliance bugs
patched:

https://lore.kernel.org/linux-media/20261116214655.6979-1-matthew.laux@gmail.com/T/#u
https://lore.kernel.org/linux-media/20261116214755.7040-1-matthew.laux@gmail.com/T/#u

The first 6 patches are changes to the existing upstream tw9900 driver to
prepare for my driver. The 7th is a driver for the MST3367 chip. The 8th
is the bridge device driver and "everything else".

I tried to use patterns from existing drivers wherever possible and
welcome all feedback. This is my own work. I accepted two small PRs to my
out-of-tree in-development version on GitHub that were LLM-assisted, for
a total of 4 lines. I am committed to sticking around to make any
improvements required.

Thanks,
Matthew

Changelog:

v5: refactor to use subdevices, so it's no longer targeting staging.
    support HDMI on the XCAPTURE-1
    detect HDMI timings from the chip instead of using a fixed table
    fix (valid) Sashiko automated review feedback
    fix composite/S-Video audio on the XCAPTURE-1

v4: add USB to Kconfig "depends on"... oops. fixes randconfig

v3: fix truncation warnings in (u8) casts >= 0x80, static-ify mode table

v2: remove unused CSC matrix control, remove version.h include,
    fix all remaining `check`-level checkpatch issues, update TODO

v4l2-compliance 1.33.0-5524, 64 bits, 64-bit time_t
v4l2-compliance SHA: 485c038f10ae 2026-10-30 13:45:36

Compliance test for usb3hdcap device /dev/video0:

Driver Info:
	Driver name      : usb3hdcap
	Card type        : StarTech USB3HDCAP
	Bus info         : usb-0000:00:14.0-2
	Driver version   : 7.0.0
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 4 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 1):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 1):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 1):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 1):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 2):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 2):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 2):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 2):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 3):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 3):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 3):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 3):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Test input 1:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Test input 2:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Test input 3:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for usb3hdcap device /dev/video0: 167, Succeeded: 167, Failed: 0,
Warnings: 0

Matthew Laux (8):
  media: tw9900: Disable regulator on runtime resume failure
  media: tw9900: accept the TW9910 chip ID
  media: tw9900: add saturation, hue and sharpness controls
  media: tw9900: use runtime PM autosuspend and power down on suspend
  media: tw9900: allow board-specific register tables via platform data
  media: tw9900: add S-Video input and progressive source detection
  media: Add subdevice driver for the Mstar MST3367 HDMI receiver
  media: add driver for StarTech USB3HDCAP

 MAINTAINERS                                   |   14 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/mst3367.c                   | 1085 ++++++++++++++++
 drivers/media/i2c/tw9900.c                    |  256 +++-
 drivers/media/usb/Kconfig                     |    1 +
 drivers/media/usb/Makefile                    |    1 +
 drivers/media/usb/usb3hdcap/Kconfig           |   15 +
 drivers/media/usb/usb3hdcap/Makefile          |    8 +
 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c |  323 +++++
 .../media/usb/usb3hdcap/usb3hdcap-composite.c |  209 ++++
 drivers/media/usb/usb3hdcap/usb3hdcap-core.c  | 1107 +++++++++++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c  |  202 +++
 drivers/media/usb/usb3hdcap/usb3hdcap-video.c |  525 ++++++++
 drivers/media/usb/usb3hdcap/usb3hdcap.h       |  239 ++++
 include/media/i2c/mst3367.h                   |   27 +
 include/media/i2c/tw9900.h                    |   38 +
 17 files changed, 4030 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/i2c/mst3367.c
 create mode 100644 drivers/media/usb/usb3hdcap/Kconfig
 create mode 100644 drivers/media/usb/usb3hdcap/Makefile
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/media/usb/usb3hdcap/usb3hdcap.h
 create mode 100644 include/media/i2c/mst3367.h
 create mode 100644 include/media/i2c/tw9900.h


base-commit: aa0f4c41d4870a18e65772a1817af16427200371
-- 
2.47.3

