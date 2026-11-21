Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795276041;
	b=PjOvhxE8OrUAYRvGLaBI71h8PWF2CBGhrNHCLKU22UUtELua44dOyTwTwUGgigEOBvxR
	 FYNMKe+WDNZCT73vB1/VyqeQmP639q5qjHni4CDEt/c41Q2odt5MsmEkqK7u/qAO1qZxR
	 NaOT2yYhb033Za/2ee7RivnFFLm88qWJnFURWCAB5DXWpKepYMHh/aBbcI2U+wMXVrYF2
	 /GS3fjMgbgZG/vHxqUD8YUxabZzV99IxL74ZBLB1wDX23B8R/dEkZh/NmHHqIEG/BNdDv
	 2DwhxdvZY3haZ/bq9U8JuEZBLjuZCt4qUOUqNp5PaFJ3CA7hWtlF7YL1pYk+B3/54HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276041;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=xAaWs7tnhPdm0UkjZ41DS0uTzg+Ib1Hg5zG2hW7/iVk=;
	b=DUSpAiTzKwNXpM983fypL3reH3Szt9BeleGebTkFfqGbQltmEbHgUUGm+QHbBQ2s8EMh
	 UQ+pjKEB+OP68QyALgsGiX22hHV7l5uuyGB4bmp7NGqSXbAidbNazKjvcANI6xXlBATcO
	 Mifan8vhpDZN6lTrQqKRnKE9/IFImInpgM9pzLH69ebeT00oyGGOT1BgMGTAEmqF2ADbd
	 NaXfHN8c01EAkgkQBmq7/LwbCjiCuu+AWyBEy5RCfMDRiTLhL7UxT5IailQohVNa4hnyf
	 tNQnsv9ve9lyZR9OB21aF5Ot1Vv/vtUM7KOf+p4RKxprdbytQ3WhlvpVjP2SgTPgkzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAbWIm7G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974B606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAbWIm7G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795276040;
	b=cj/zMbhcCgbOfPkgAJ9l3msGltM91etZ5vC8Vw8rFB6oTvoqYkMzeMM6gI4VPFNQU8uc
	 nqBrmtySmY/1VS0CSfSH8+Dg9jEe7VjElt2S2eUeRbs/pDC0SaTnbvvESOiIcnuk5w8ka
	 W5dDaX78y5HbtE4SzNTiW/x4fufm35CC11tUOhv0HElLdKNDcCjM7MZ8dUwtH5+TYw//Z
	 gC+SJhhWrMHXei5URODzZpXYKF9ilew9dfgcbY381w3rcn/O0wAA0YoIW21Gbzgff2QpV
	 /6vc9H+dGldtqWTbwpSxcni7keVZlZ9d5HOAW47SV+UunhqOy4TzvKSd4ImvaeBIAvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795276040;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=xAaWs7tnhPdm0UkjZ41DS0uTzg+Ib1Hg5zG2hW7/iVk=;
	b=lAcspmW+vw2ebD29sjXAMTEU0ABYQdlAOaK/zTDN518fd7sQk9XlhiJXJBB5cy8AHizf
	 F1IoZkOkMdZrnKC+UJnxXgnUQACcx4cQ6c2LsL++RStTWoMSoq/5Syn1ALCoAx7gqpLgx
	 OtrLWCmZe/nFW6AaOT5SBpLS38rR/8S5IKIKgr+Cuz5xekdCFJ396P0D5sKe9l9pkmoV/
	 b1N1Baw73GQTON2xNkDxsc4evSAtIfU0hfEwZsrf1TA7USVCGkLE84Kd9E9jEk9luYGZP
	 ZvWJU37z6QoZculv79Dj8RDfJ+MYpEZBkRR1xgGKeoYf/R6z0zQ1vIfE0TkZ/88rt1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27F731F000C6;
	Sat, 21 Nov 2026 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795276040;
	bh=xAaWs7tnhPdm0UkjZ41DS0uTzg+Ib1Hg5zG2hW7/iVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MAbWIm7G8PvzrCrAk+Z8FdrcDibCxKvrCY/MjKlDEjpXF8TU/+E2NuRczvuwXk3Pm
	 cEDGh0hQ13eTDWAKRktqf6jbSJ7aHZlTqHwx4i8uHnFP4osH6CaGMgCz8h82yA/4g3
	 CUvkqWqUT+rNn+AMgBqQ8W5OTYwR3dRnymsP/EUO74Q1u2teMtkWMDENXu8jfMEiSF
	 yExja7MEUFhRcMR6SwVupPjINiUcOhrEkN5XxAjkvlhU9swD3eCuf+Qz7finewMWr8
	 nrhazhU500Fj2oWKi6aRnGajxqZyUvYkejI8Ay+5FfI+BzaWCJ3rKKqczkzBf3dE36
	 zwmzn43KZP4Cw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9E3BC4BCEB;
	Sat, 21 Nov 2026 15:47:19 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:47:19 +0000
Subject: [PATCH v2 1/2] drm/imagination: Destroy the common FW object when
 HWRT data setup fails
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
Message-Id: <20261121-pvr-hwrt-common-v2-1-9f53bdf954de@gmail.com>
References: <20261121-pvr-hwrt-common-v2-0-9f53bdf954de@gmail.com>
In-Reply-To: <20261121-pvr-hwrt-common-v2-0-9f53bdf954de@gmail.com>
To: alessio.belle@imgtec.com, luigi.santivetti@imgtec.com
Cc: donald.robson@imgtec.com, mripard@kernel.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 airlied@gmail.com, simona@ffwll.ch, tzimmermann@suse.de, 
 linux-kernel@vger.kernel.org, imagination@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795276038; l=1676;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=MHKXJgZOOagXdoeMVKaVOvUJKw3HED/Jvyvqgrk+KD8=;
 b=KHQaK08V43C/o/U4Epdvo2FF9YnhyO8sBIRF7lrCa8Ug5ObGm7Rq6kUZGl258HzbXJ9zKrAao
 z0odM8v1AG8CDn+MX3oppF2ESpcsCIJXa8pKcDvn7yidaisLfBxc9GM
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

If hwrt_data_init_fw_structure() fails in pvr_hwrt_dataset_create(),
the error path frees the per-data FW structures and then jumps straight
to err_fini_kernel_structure, skipping hwrt_fini_common_fw_structure().
The common FW object created just before is never destroyed, and its
init callback data is the hwrt that is then freed:

	err = pvr_fw_object_create(pvr_dev, ...,
				   hwrtdata_common_init, hwrt,
				   &hwrt->common_fw_obj);

Besides leaking the object, this leaves it on the device's FW object
list, so a later pvr_fw_hard_reset() calls hwrtdata_common_init() with
the freed hwrt, and pvr_fw_fini() warns that the list is not empty.

Destroy the common FW object on that path, in the same order as
pvr_hwrt_dataset_release().

Found with a static analysis tool and checked by hand.

Fixes: f1f55ed3ffe4 ("drm/imagination: Fixed oops when misusing ioctl CREATE_HWRT_DATASET")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
 drivers/gpu/drm/imagination/pvr_hwrt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/imagination/pvr_hwrt.c
index 3f7c4346c52c..aa25f6adaa3b 100644
--- a/drivers/gpu/drm/imagination/pvr_hwrt.c
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
@@ -483,6 +483,8 @@ pvr_hwrt_dataset_create(struct pvr_file *pvr_file,
 	while (--i >= 0)
 		hwrt_data_fini_fw_structure(hwrt, i);
 
+	hwrt_fini_common_fw_structure(hwrt);
+
 err_fini_kernel_structure:
 	hwrt_fini_kernel_structure(hwrt);
 

-- 
2.34.1


