Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795495160;
	b=fyoPisFjR2pFyW3wuF3zWVIw2DLKAh2MPWLFP4g9wwwoN45LFpwwKYNqByUPA38xc9fK
	 AzQ/nV7uR0aH6T1BYzTAB/7tdFMginl3pHqCGVWxngNNLUSoYZzB3izIytz0GEN3aD6V8
	 AZsA+wGel9KVTNppyK9bKj9SS+tJuEyc3RdtxfGfzFLxWQefuYiFJRN3LMPa4J3c8u972
	 8o8Mym22qpqPlK5M0SyWGDsXPVbm5iDPY7QdAR6+gDmS9PvHTfXiy0aqGnqYX5nsQil0Y
	 syJRaQ9dQhzr2Tdt79xFmLx5BlcQajmq+h/kLN4RGy0MQvPcv9myV6yi9y9QPk/7j9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495160;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=i3Pcf/y1fK5W0mKl2UYdbwNbl15Wboo4OxSctTetQzc=;
	b=ujmHAD97oIuZvXWy5R2XFqGVlTrGFqIaNrCvYVKrnEoNUHAH2+OjlMIkhucyW07AAbNW
	 bJWphltDSuSi+ca8o0zBWJKNoMhtd16jlQxNcxWgm8jn+GK6cSxpaLcJwoOSTj2YkNNwo
	 LkcV2KOzNM/KeTjKvsdmidQqL6ZWNyg4uN6PUWqlnO/zeM4BENcW7822oh0PWRPcAuoUb
	 fM6RDCNb25QHCQ5ND0z52XbY74LIucbIaVGgUKHI7Pndufs6aOjcTi46Hg4zPRaonhMOy
	 DsSLOg4Y4HT9miNMgCMYxwNHdAu0FwOpNDQEXYXDZ7Vfsglo/63RJC4KiQxqNZOxwgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMcxJDft;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA58F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMcxJDft
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495159;
	b=wzP3SXuiTrvBV4eqKVx7ZJxwQg6D0wUkDk9zyElcVAp1CzpszW3exRLr/7TyUltjUCLI
	 PYSXbGY5KO0QHqyKyKl+fd5LH2/sJHni3U1Ddqsk20F7WWGcu4yC4olVT23eZ3xQFDd+R
	 obnW9NG3h1OiXuF7RuI9GdETHdFnb4MOyO8S3VCGVIuvsxdJ/IyWkDfPxTILuRQCAJO8q
	 bg9Q99NCJe7TEt3J4UmNEh70VMCIamdoRLGRprWAk1Ch8wkB3dX/sWl9RtvBRNjUiKll2
	 bAIM2ew+WHgqvqTqsIBw4avnUwr7gmV2vz8vnMwRqkA0GxjVRPYGBPc8zr290AxYogA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495159;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=i3Pcf/y1fK5W0mKl2UYdbwNbl15Wboo4OxSctTetQzc=;
	b=favzY2uEULONvXtvaDQaW5oo/GyqQW/svq7nn0jeAmd57yvzx4vTnxIDuLNTJZma+IQf
	 8j6NNWXZ5zZourx/EWyWSxDbi/wGbMBo5w3quhjqa3TivfquZ1IYoFbzz0jOl4Qfq9uEY
	 JW1QUnmnSTFTEbOk+MN3GlnIH7AskKgGnEUD9n2BE/3Ny/7rqYywE6lLQFeytuq3+DI+b
	 f6d+Xob701GVMa1DzEAzb1jfA5ciWmodTnzjilXVElmHp9VCaAXN2bwNiBG4mUaZ7jypb
	 jvtOGJfGqiHH6bY9rZze427zuecgrXCv99a4Yp3A+qvf6hbrPco3wC8fZUIM8LsMRKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B324A1F000C6;
	Tue, 24 Nov 2026 04:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495159;
	bh=i3Pcf/y1fK5W0mKl2UYdbwNbl15Wboo4OxSctTetQzc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PMcxJDftYIfYCIVkISyTO55gv4qQACXorDdROD9NHAydOGkMtBMVnz2N3HBtT8n5s
	 up6iPO2WPQFPIvxH+9+kfyMHRWT1MKlofl7Va6lsBrSsZCnFhc2VIjscHtAABHQ2pI
	 sihKFtV8bAIfRTVoG65bziPGBwUFDjA/I7iduZKYqsqukRhafrVQ9/bNlF981WKmP0
	 AHpnUMnEI6wdm7er+hPb25Jne9s88o7b/JGchoWw0+Bayim0QZsUrq/YsNkFFqYKGJ
	 grnTQQ+jQeeo3Dru5FIR6E/x0q8i8ATxPqzPeKOjR5aUp3+dAoUFYKD2FVs6B3BEVs
	 Slw/UXkM7RPDg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 19C9B4C89D;
	Tue, 24 Nov 2026 04:39:16 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 04:39:15 +0000
Subject: [PATCH] drm/lima: Drop the BO references if drm_sched_job_init()
 fails
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
Message-Id: <20261124-lima-task-init-v1-1-2f6129257703@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPIUBWsC/yXMQQ6CMBBG4auQWTuJbaSJXoWwaOFXB6SYTjEmh
 LtbcPkt3ltJkQRKt2qlhI+ozLHAnCrqnj4+wNIXkz1bZ4y98Esmz9nryBIlc+1wdQGhhwWV6J1
 wl+8xbNq/dQkDurxfaNt+W2MAHHIAAAA=
X-Change-ID: 20261124-lima-task-init-56e96bebde2e
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 airlied@gmail.com, tzimmermann@suse.de, simona@ffwll.ch, yuq825@gmail.com
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495155; l=1654;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=/psVm8KZ+NeNNkX1NAHNJo3pQfX2J9S1jdpWT36nW1c=;
 b=D9Y+EJAIZAEfI2n5DQLlisXJ/b+PO18rZa6q9Leh9qSy6G8ULP9bTgAOY81dFvUWiZWyL/8Qs
 2Ghk91cvyYIBUoUlVlSz+vCuekbT2Sw5o2rL8LdZZ2qaGZOPtxGGYlA
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

lima_sched_task_init() takes a reference on every BO of the task before
it calls drm_sched_job_init():

	for (i = 0; i < num_bos; i++)
		drm_gem_object_get(&bos[i]->base.base);

	err = drm_sched_job_init(&task->base, &context->base, 1, vm,
				 drm_client_id);
	if (err) {
		kfree(task->bos);
		return err;
	}

If drm_sched_job_init() fails (it can return -ENOMEM), only the array is
freed. lima_gem_submit() then goes to err_out1, which does not call
lima_sched_task_fini(), so these extra references are never dropped and
the BOs are not freed even after all other references are gone. This
can happen on every submit ioctl.

Put the references before freeing the array.

Found with a static analysis tool and checked by hand.

Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 (W=1). I don't have the hardware.
---
 drivers/gpu/drm/lima/lima_sched.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index fee595b9629a..53d597850782 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -130,6 +130,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
 	err = drm_sched_job_init(&task->base, &context->base, 1, vm,
 				 drm_client_id);
 	if (err) {
+		for (i = 0; i < num_bos; i++)
+			drm_gem_object_put(&bos[i]->base.base);
 		kfree(task->bos);
 		return err;
 	}




