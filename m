Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795886144;
	b=V9YoR9qDiJHA4cKo8HUI8A5mbsyBP41Pg/prGSlL0r0G0pSj+VVTnW8HBhlF0WMfUs0N
	 da9pCAqeogrfAQZvw98a8Mv43ettOep/89NHoAdhH6BRb8M5O8M6oWVz+VwbOliCJovv+
	 KNSSNAQl7dr0uTtJf5tlXMaVfPYN1P/F12R+p46iRUss5Ik+qWHv/INkzrBNGaABxu3Ne
	 4IUtg0fs9O5HMzqtU7Gdl8WbVUAXmG6Kb+cdrYen4AG2DT+9JNg1cXT4H4wG123BiFNcq
	 2TjfyW0e77+Iy5NhpowFtWX/iaxZR3j7qbTvnExYUOJBtpVRYDUTvllkwqY/O9xhXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=c7lRhIZ1lucgxxIozXg9UvJgXnzl7rH+vnRSnjlvfRk=;
	b=BLhNn5sEqJBC0skA0pcT4x9VyGum4Iw4mIKc4/5ge1wYVkgME80gq52Up3zICduaC9YJ
	 gX9Tq4FacG7ExbazR16605ySbPrkgWUaKrmXTf0RNUCwMkszYzvZy4+WUTOUv2n7h0maL
	 NKE8A01KybmQgbcYFom6R+wXYQPFMDo+rHrqKbbom1UJOg+OirAOFGp+6QueC+YlHqsh7
	 qdk2RD+DXVOf+MNIaPeQtZ5T3Soh+RmLJS9GAMFY6K+SZTm6QZDTQvWLl6yw4cdo84U/M
	 hkUFWch3PKsC6L0mtVKrEyNLBm8mU8ZLRctVqmHMbBozSJG1+ibZNpeJGWXN2VCcH7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0cm26yp;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3338606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3338606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0cm26yp
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so87752275e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795886142; x=1796490942; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c7lRhIZ1lucgxxIozXg9UvJgXnzl7rH+vnRSnjlvfRk=;
        b=H0cm26ypmaz44xK5JM4E3zI9jwq6545wC43rhQViTff/bFTLwv8pIXvsehH6aealjW
         pbaym43Fq3HgjRT+aGk2i0BEuZ7ZFfNsojaXQxGcoLBygvvcwvX3tPe7BVP+RsxShsGf
         NvvObQwvK0GEd2LLorsu9tcO0BSluSXolSLO2bOTkjMyMUY0AfITxvljMxVMV9D+zFBi
         SAsIMWVUaS+6MnDpqzrdEb8G21M5jg5mtIu50xR/DlJMz9QPTX5/JVAgtP5udNNrQ7cp
         Vc0BmDGfU3WeXCSJ0AJGal2xqmD59Unx9bZW+2z9H5V9hkfruGAOaeA7UdZwUKRx17DK
         YeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886142; x=1796490942;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c7lRhIZ1lucgxxIozXg9UvJgXnzl7rH+vnRSnjlvfRk=;
        b=qrDlXsx8I5Aunc9ydZ1xAShuRgpKhjA8jR/aAggq8TVLpmO5vHFf4EJ6YxIvtO3pnl
         pZeoGncCVtcJ6BJchE2Xb6CuHrut8ejoGrJ4Z7JauzYFS4Bc+aIT+yAvEeTAhpd2Ozeg
         NCXdkXqwzUHc+fXfmVPDhzt5yJ7dtLZNBvZU/Rc1Eu05Tlsho3ZO31VfqwpvqO6s7tFw
         /6NwmD2s3QQB4BQuS/P1OlUUx8dwtdraZfQkDDxppi8pQU3bcR7ew5RQ0J7UxS1tT1Xm
         NgJabqlTVU5bHl9M36tENXE7XOKTfS4oIgHR3l4VhOrgCv7qVWwxkS50RdViA6lfB6Pj
         UEGw==
X-Forwarded-Encrypted: i=1; AL+hErFBjlNes4mpJfJl7JRknEvvYRT4VOFGHIKYCZJRVSuKGY828WwIQWxe64nUHWtQHSi6nYplk3xyYyXrJkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JqarWt0GLKDp6h6MLk0QRhaE6NTMjpVWKDPM96JlO5oZNw/hf
	50YLrFOp9JXIQwhQKT1m7yekBIqmRuY+BiBCQCrY9mI4i12ICfkcPQ1Nu8SB8xGQU2ddTRWB
X-Gm-Gg: AZFdTZfsuE1We/swSL4Vs7gl5WrUlFYmY5R9NW2YMn9fpFRE3ZaZSaCH5FxkCvUR+o/
	3yqpSCWD5x0kf8/ot3AU507srSdJ7NxBJBrAEKcJ3uSfMfZmPEEhvK41bJDlqfo4OiXXczHIU2J
	PxdNxg8PmadnBksVSJDezEm04bvbGMUxqELlfUWUDl4PvAwvi3ZK6UDrilzaEX6eDtcnXkfPbGv
	Ejvuop/ZDQXf7JLVl1jCeQMWJDX9phlQXn7QY0oZBZQIJKfvuhzhg50D+nj9pFre0A7P/XJ4oK7
	MgF4hxsIh7vMafAFRP7d+n17d1VGRrIT+1+nGAtzpUOphG/dBRu5Uc+ZZpgEfvZnJ0afoC+raRx
	1/zsmP/EgtVp2f7NW+ndyu67GcTDpuYP45Z2F4x5ovNtbEHdsZTgMMps8KtWEjPQ8g9mPADCNvw
	vyqTT9aMWJc9afgdwN/qJ9D9+OFMMw0UgChev9N322mGCAj+0Ero0f8pNdw4/Fb2fZPsmAWyvOW
	tKWo5X46p87XDh/6TPkD1yem5NmI5z4N27iNi9sUfyUqGXgpf+QAKQc0++xgJfSdApP/tXMI9n9
	V2sV3n48j1OBs4eOKccM0oDttzQ3DePldk+fwQ==
X-Received: by 2002:a05:600c:64c9:b0:4bb:679a:86ee with SMTP id 5b1f17b1804b1-4bb88938dbemr559567025e9.29.1795886141801;
        Sat, 28 Nov 2026 09:15:41 -0800 (PST)
Received: from [10.56.169.198] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm45654229f8f.46.2026.11.28.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:15:40 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH 0/7] drm/vkms: complete the plane color pipeline
Date: Sat, 28 Nov 2026 18:15:18 +0100
Message-Id: <20261128-colorop-v1-0-dd79919f822b@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAQBCF4VfRXNsyNlO8ilywBiNZ7SK1eXeLy
 6/+cwJ4dsIeqiSA41O82DUC0wTM1K4jK+mjIc9yQkStjF2ss5uiUg8ZUosF9RDrzfEg1/dUN7/
 90c1s9ncO9/0ACJT0emsAAAA=
X-Change-ID: 20261113-colorop-693f016a156d
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Alex Hung <alex.hung@amd.com>, 
 Robert Mader <robert.mader@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Simon Ser <contact@emersion.fr>, 
 Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The vkms plane pipeline has a fixed matrix, two 1D curves and two 3x4
matrices. Userspace cannot supply its own LUT, do a 3D lookup, or apply
a gain to the channels.

Patches 1 to 3 fix three bugs in the pipeline plumbing. Patches 4 to 6
add a 1D LUT, a 3D LUT and a multiplier. Patch 7 adds KUnit coverage for
the 3D LUT and the multiplier; the 1D LUT gets its coverage in patch 4.

The color math has KUnit coverage; there is no IGT test for the color
pipeline yet, so the uAPI paths are not exercised end-to-end.

The three new colorops are appended after the existing ones; their order
is unchanged.

---
Oarora Etimis (7):
      drm/vkms: add the colorops of a plane that is being enabled
      drm/vkms: free the colorop whose initialization failed
      drm/vkms: use the colorop states of the state being composed
      drm/vkms: add a programmable 1D LUT colorop
      drm/vkms: add a 3D LUT colorop
      drm/vkms: add a multiplier colorop
      drm/vkms: add KUnit coverage for the 3D LUT and multiplier colorops

 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 194 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c          |  61 +++++-
 drivers/gpu/drm/vkms/vkms_composer.c         | 314 +++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_composer.h         |   5 +
 drivers/gpu/drm/vkms/vkms_crtc.c             |  59 ++++-
 drivers/gpu/drm/vkms/vkms_drv.h              |  61 ++++++
 drivers/gpu/drm/vkms/vkms_plane.c            |   2 +
 7 files changed, 646 insertions(+), 50 deletions(-)
---
base-commit: 5ce32a0c94a827ff44ee60898c28060714dcff75
change-id: 20261113-colorop-693f016a156d

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>

