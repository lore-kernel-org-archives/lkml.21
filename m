Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795024136;
	b=ORtzY4AfK++q1ixlg2PVm3gmX8FOyZq/UbE5IRpCSrvrGgNDrp7LlZoD5URF/yGBTcLs
	 XORDhHqz3Md2kBfZ+qzrbycAcnUDpfCwHvint/Jk7DOKS+c3zdkgW0yvp7Sv2rkZd5Oga
	 xaGQScrlX9BdyU/3X+H/Sowqvk7fc2gVrnb0uv6c7nxmR1EP89SwRl1o87Y/bDHvl5x3u
	 1PukhjFMrtAz74QUcpMKQXg4ocpRFf95Q/gwOHlwDOOFDByLQvJt+2qX7lZ52u2db2gW3
	 2qM9cj8OKXDJ5mHmsBP8BGXOlKMnOMiN2HYRHt4jR/tzz12xDEb0JcVZjq3rj1rY3sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wr30cMHonchN/OcY5dnyS3PpKpMRWN/pwwCr/ZBhg8w=;
	b=jngfjhczt7YgYAwar3VY6bTLYgcmhFOSiD5T0LYCc0+4pixhHar2wDlQfAJ850meVfFd
	 Go0mq2A0E4j5DdbVcxEIdxfkSQ69UDTixek5cg1m9hs3+IKQdK4gio2cJcWBH5J0op2gv
	 9oHx8XnQDHT6v9PGZHScVWp05rj23A2bM7ctrjJmT/ciGdHA4Ptnga9lXMw4KGjDVmU85
	 DFM+xtPvHXO7dOo5CogCrutZbRbbi1WI+JqjxBJZ+ctNRj0EYs/yOc1Lxo6ZVHNOtqsce
	 wYrdG37hKyq7TnyKzvaFF9IyQjHVJm2p84lcrXIeVPSRU2bk6NhtWWXCsUGmXNi8IUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGKGcD10;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB5E606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB5E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGKGcD10
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so1557539eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024135; x=1795628935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wr30cMHonchN/OcY5dnyS3PpKpMRWN/pwwCr/ZBhg8w=;
        b=jGKGcD10zuuvbemW4bPxdnTAvrh5acMqnkHC9QPmodQnAH3JPYwq2k6YST7GKSN5/E
         Tli0G7HPYxtZttpgadZ/DIUZu3VI61uWIftKBiLS/tNQomtTdk4zf0XEnADSiwZXH/uH
         /S1yUXXIMjHhzPABjuPqXqaGWUj6SPLuLHANWi/NZv1vvb3cpl01hwbe4stQgIPoB2OC
         lRs6NiTW3y3kiyvigaolVY/orZrSYwRnca7GeMqSKBYX6A4nnXePJy+x+00GTgSh6Svq
         YguPj8NLYZxdwJzSdln2RmjRR6yM9QOTaAj02puJubAqHMOShL/sSW2JoRLhItsfYFt4
         yiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024135; x=1795628935;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr30cMHonchN/OcY5dnyS3PpKpMRWN/pwwCr/ZBhg8w=;
        b=GCSaQ1oUFDBYpTvFUskn1N13DpLFJBkPSEiYF+LZj9JSW/N1z0WHpJ6hgR/mRhIwa/
         pswMUGXH7oY/5y+K/tex+hOgqlEHS7KzP2LWCPXhGYulOA75QvldC4DjkxupkKWbCGl0
         EZ0R3fF2I4q3eNQWrXg5OEMiyk/9B6u7vIBjxMKumUEE8xGYwszKj8dDpJCrKm2ZNJV5
         Q1qsPwfJWT7qsPSj8UOMAYjQpASV8Un5zcmD8YYL8BBAVBWnMyDJESPAcjymh2Of4t3c
         YZUxPR/EsnOhCSvu4PCpqpZFYPzjF60auns6OZKKds/OVi7UagkRYLHNQ+p8HJF+ZnWi
         eg+w==
X-Forwarded-Encrypted: i=1; AL+hErHhy+EAWyBfNWpEsDH53Mr1S3Hqc/Ymmqqi5w5dosY31QmsOXfmR1m+DiFiXqxVHvWMyZ05Or9enjcjtoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QzmgdafV0BDLXL166eNyKokmDOGkw+cceG7vBV8+1vP/VZFcY
	8RUTPHXJqrhmaLOH9IMRDOWB5H2nKRgFINtVuizQYyTxsiQtX2hMsgn6
X-Gm-Gg: AZFdTZeehq/UrY9QjA/7WYpUV651EwoOp4m3qRTTEhVOSvU8Qbn+VoQ4kLmfiLvZAb9
	hTNU/dV6LmbkzzSX3xEHCXIzzRlPHT3Mnkq9BOwRtG32VljWqMcqxMmEohx7LUgUtfyBF5ltw9/
	C2J6SvycC+AXMNVE7vpaH7l0X+WRyElkBI6cScEPlHQNv/+TvNJ/ShJg4IJDyivxSNiKEEsFu8c
	d9APs+8jv8BXR4li4ROYFfjQXFA2/+21xlOXOFvH20P8YSP713pOe91WD8IvcmcOZ6FKOfx/06r
	Jcu9uYUWxvONRGMryVKqfXgjB87Gekj83mEjuqIXLTdagPxeujUigDvkaJZ5FeiLyBpXgnFVPVm
	fIACgkOeTnxRKLtbXlyPoUhZeGbOJOY+LHEWnlf6HnN2JPGFc4kL4/xJEdqVRue1YhTel/vmoTe
	ZhhhtNauphSTzA/8UpLaJwymKe04hABvDUZDXHD0Ej3/fMca0xOInlFaJVfFO5B95/N23biAa6P
	DTvxb21PamUoYuXs/tEZAChZpagxCuMAJ25y+YfXx6kkIzIGH5kJr/Py26hL/iDh+sWX7A8Arki
	i80kyN9uXX/TV7jpkPSNFRpYY0eOSNwYkqc1Epmmm8Ujqu6DwKWpxBQhWvCTUFUce38MfDQ=
X-Received: by 2002:a05:7300:f793:b0:369:daea:812a with SMTP id 5a478bee46e88-3828171b3a5mr2550884eec.30.1795024135142;
        Wed, 18 Nov 2026 09:48:55 -0800 (PST)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm9420878eec.29.2026.11.18.09.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:48:54 -0800 (PST)
From: Henry Zhang <henryzhang62@gmail.com>
To: mripard@kernel.org,
	mcanal@igalia.com
Cc: dave.stevenson@raspberrypi.com,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	henryzhang62@gmail.com
Subject: Re: [PATCH] drm/vc4: dsi: Allocate the encoder per DRM device
Date: Wed, 18 Nov 2026 09:48:16 -0800
Message-ID: <20261118174816.1382711-1-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <av11cTfEuyFJW5h8@houat>
References: <20261117205902.1293962-1-henryzhang62@gmail.com> <av11cTfEuyFJW5h8@houat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026, Maxime Ripard wrote:
> On Tue, Nov 17, 2026 at 12:59:02PM -0800, Henry Zhang wrote:
> > The DSI encoder is embedded in struct vc4_dsi, which lives as long as
> > the DSI platform device
>
> That's not true.
>
> It's allocated with devm_drm_bridge_alloc() that will *not* free it in
> remove but give away its reference there.
>
> We have another reference taken in vc4_dsi_bind, that is only given up
> through a drm-managed action and thus will only be freed when the DRM
> device is destroyed.

You're right, thanks. struct vc4_dsi is refcounted through its bridge,
and the old DRM device keeps it alive. I'll fix that sentence. The
problem is not that struct vc4_dsi is freed too early, but that the
encoder embedded in it is used by two DRM devices at the same time.

> All vc4 components should be tied to the DRM device lifetime so that's
> not generally correct either. Something might have snuck back in though.

The encoder itself is DRM-managed: it is initialised with
drmm_encoder_init() and cleaned up when the DRM device is released.
But it is embedded in struct vc4_dsi, which outlives an unbind and is
shared by the next DRM device that binds the component. That part is
not tied to a single DRM device, since 6f0ca506c30e ("drm/vc4: dsi:
Switch to DRM-managed encoder initialization").

> Also, generally speaking, unloading panel drivers is unsupported at this
> point. It's a work in progress, but requires more changes to be safe.

Understood.

> This is surprising though. I'd like to see a detailed analysis of what's
> actually going on on mainline because it doesn't look right.

Maíra asked the same, so this answers both. It reproduces on
drm-misc-next (fb191ef62) on a Raspberry Pi 4, DSI1 in video mode, with
an out-of-tree DSI panel module and no downstream changes to vc4. The
compositor is stopped, a process holds /dev/dri/card1 open, the panel
module is unloaded and loaded again, then the held fd is closed:

1. Unloading the panel module detaches from the DSI host, which deletes
   the DSI component and unbinds vc4. The held fd keeps the old DRM
   device alive, with dsi->encoder still on its encoder list and the
   DSI bridge still attached to it.
2. Loading it again binds a new DRM device. vc4_dsi_bind() calls
   drmm_encoder_init() on the same dsi->encoder, which links it into
   the new device's encoder list.
3. drm_bridge_attach() returns -EBUSY, as the bridge still belongs to
   the old device, so the bind fails.
4. The failed bind releases the new DRM device. drm_encoder_cleanup()
   unlinks dsi->encoder and clears it, but the old device's encoder
   list still points to it.
5. Closing the held fd releases the old DRM device, which walks that
   list: list corruption, the WARN in drmm_encoder_alloc_release() and
   a NULL pointer dereference in drm_mode_config_cleanup().

Kprobes on drmm_encoder_init(), drm_bridge_attach() and
drm_encoder_cleanup() show it (condensed below). The old DRM device is
ffff000049249000, the new one ffff000041a79000, dsi->encoder is
ffff000044138000 and dsi->bridge ffff0000441380f0:

  223.656483 drmm_encoder_init    drm=ffff000041a79000 enc=ffff000044138000
  223.656520 drm_bridge_attach    enc=ffff000044138000 br=ffff0000441380f0
  223.656529 drm_bridge_attach    returned -16
  223.715147 drm_encoder_cleanup  enc=ffff000044138000 dev=ffff000041a79000
  (held fd closed)
  233.848952 drm_encoder_cleanup  enc=ffff0000409cca58 dev=ffff000049249000

and the first list_del report shows the cleared dsi->encoder.head
(ffff000044138008) still linked in the old device's list:

[  233.849039] list_del corruption. prev->next should be ffff0000409cca60, but was 0000000000000000. (prev=ffff000044138008)
[  233.849099] WARNING: lib/list_debug.c:62 at __list_del_entry_valid_or_report+0x128/0x160, CPU#0: python3/2080
[  233.849394] CPU: 0 UID: 0 PID: 2080 Comm: python3 Tainted: G         C O        7.4.0-rc2-dmn-test+ #1 PREEMPT(full) 
[  233.849424] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[  233.849448] pc : __list_del_entry_valid_or_report+0x128/0x160
[  233.849465] lr : __list_del_entry_valid_or_report+0x128/0x160
[  233.849734] Call trace:
[  233.849744]  __list_del_entry_valid_or_report+0x128/0x160 (P)
[  233.849764]  drm_encoder_cleanup+0xcc/0x150 [drm]
[  233.849950]  drmm_encoder_alloc_release+0x24/0x40 [drm]
[  233.850090]  drm_managed_release+0xb0/0x178 [drm]
[  233.850231]  drm_dev_put.part.0+0x98/0xd0 [drm]
[  233.850371]  drm_minor_release+0x20/0x50 [drm]
[  233.850511]  drm_release+0x110/0x148 [drm]
[  233.850651]  __fput+0xd4/0x300
[  233.850672]  fput_close_sync+0x48/0x110
[  233.850690]  filp_close_sync+0x2c/0x48
[  233.850706]  put_files_struct+0xd4/0x148
[  233.850723]  exit_files+0x4c/0x70
[  233.850738]  do_exit+0x25c/0xa20
[  233.850756]  do_group_exit+0x3c/0xa0
[  233.850772]  get_signal+0x920/0xa18
[  233.850791]  arch_do_signal_or_restart+0xa0/0x3f8
[  233.850808]  exit_to_user_mode_loop+0x100/0x188
[  233.850825]  el0_svc+0x1cc/0x1d0
[  233.850845]  el0t_64_sync_handler+0xa0/0xe8
[  233.850864]  el0t_64_sync+0x198/0x1a0
[  233.850879] ---[ end trace 0000000000000000 ]---
[  233.869067] WARNING: drivers/gpu/drm/drm_encoder.c:228 at drmm_encoder_alloc_release+0x30/0x40 [drm], CPU#0: python3/2080
[  233.869478] CPU: 0 UID: 0 PID: 2080 Comm: python3 Tainted: G        WC O        7.4.0-rc2-dmn-test+ #1 PREEMPT(full) 
[  233.869506] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[  233.869529] pc : drmm_encoder_alloc_release+0x30/0x40 [drm]
[  233.869668] lr : drm_managed_release+0xb0/0x178 [drm]
[  233.870051] Call trace:
[  233.870059]  drmm_encoder_alloc_release+0x30/0x40 [drm] (P)
[  233.870201]  drm_dev_put.part.0+0x98/0xd0 [drm]
[  233.870340]  drm_minor_release+0x20/0x50 [drm]
[  233.870479]  drm_release+0x110/0x148 [drm]
[  233.870619]  __fput+0xd4/0x300
[  233.870639]  fput_close_sync+0x48/0x110
[  233.870657]  filp_close_sync+0x2c/0x48
[  233.870672]  put_files_struct+0xd4/0x148
[  233.870688]  exit_files+0x4c/0x70
[  233.870703]  do_exit+0x25c/0xa20
[  233.870721]  do_group_exit+0x3c/0xa0
[  233.870737]  get_signal+0x920/0xa18
[  233.870755]  arch_do_signal_or_restart+0xa0/0x3f8
[  233.870772]  exit_to_user_mode_loop+0x100/0x188
[  233.870787]  el0_svc+0x1cc/0x1d0
[  233.870807]  el0t_64_sync_handler+0xa0/0xe8
[  233.870825]  el0t_64_sync+0x198/0x1a0
[  233.870839] ---[ end trace 0000000000000000 ]---
[two more list_del corruption reports with the same call trace cut]
[  233.875117] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
[  233.875331] Internal error: Oops: 0000000096000004 [#1]  SMP
[  233.875631] CPU: 0 UID: 0 PID: 2080 Comm: python3 Tainted: G        WC O        7.4.0-rc2-dmn-test+ #1 PREEMPT(full) 
[  233.875679] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[  233.875717] pc : drm_mode_config_cleanup+0x58/0x320 [drm]
[  233.875875] lr : drm_mode_config_init_release+0x18/0x30 [drm]
[  233.876371] Call trace:
[  233.876383]  drm_mode_config_cleanup+0x58/0x320 [drm] (P)
[  233.876539]  drm_mode_config_init_release+0x18/0x30 [drm]
[  233.876692]  drm_managed_release+0xb0/0x178 [drm]
[  233.876842]  drm_dev_put.part.0+0x98/0xd0 [drm]
[  233.876998]  drm_minor_release+0x20/0x50 [drm]
[  233.877149]  drm_release+0x110/0x148 [drm]
[  233.877299]  __fput+0xd4/0x300
[  233.877330]  fput_close_sync+0x48/0x110
[  233.877355]  filp_close_sync+0x2c/0x48
[  233.877377]  put_files_struct+0xd4/0x148
[  233.877400]  exit_files+0x4c/0x70
[  233.877422]  do_exit+0x25c/0xa20
[  233.877446]  do_group_exit+0x3c/0xa0
[  233.877469]  get_signal+0x920/0xa18
[  233.877494]  arch_do_signal_or_restart+0xa0/0x3f8
[  233.877519]  exit_to_user_mode_loop+0x100/0x188
[  233.877542]  el0_svc+0x1cc/0x1d0
[  233.877567]  el0t_64_sync_handler+0xa0/0xe8
[  233.877593]  el0t_64_sync+0x198/0x1a0
[  233.877620] Code: eb0102bf 54000160 d1002294 f9404001 (f9400421) 
[  233.877643] ---[ end trace 0000000000000000 ]---

Additional sanitized trace excerpts are available on request.

With the patch, the same test on the same kernel still fails the bind
with -EBUSY, but closing the held fd gives no warning or oops, and
loading the panel module again afterwards brings the display back. This
was one focused run per build, not a stress test, and the patch does
not make the rebind succeed while the old device holds the bridge.

Would you prefer a v2 with the corrected description and the mainline
trace, or should this go with the panel unloading work?

Thanks,
Henry
