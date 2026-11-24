Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522772;
	b=mbsUhztkWsTQCntXMVDq4cgCsGpVf7vnAq/I2+GOXvKJr0V/dRtMnyXWD+vs/8vLATc6
	 3bKtAJGAbyBw2zzdPjbZZxqe2DTxNCh8/6dNc3yVdnglOrAALT7hhBbnpjeATr4rNtt/b
	 T2r0YGYXIIZCRjKZb0dMGXP4p2lQeEFTrrXAMnmiCi8wJjdpRQShpJsFKdPo48/cBJXMc
	 0dSvz46wnEtD7f2kEG17JajNubiVqwO352rghwFCh21RJwhlX7+VmDpWf/6onCGEitgxt
	 QLR2ElD3mgzSa/kvwwuIgSg2+WzOPipCazbRtRWChZvOIjO18E0+pVkCP6yTZVjjeFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V8j/7x8rOY24muk9yPjpnNTz4+yzbaLuw/EWCrjOA/0=;
	b=ueA2TFUx+0/DIVnF40PsHBLm3CEa3p3M4mNc3zFZol7xJkHNoeJc7zN/Fxcq6v+P3P0u
	 DYlWlAHnlq1bifwAPPw8vRlvnkzJGgZRLvDtPPKXe4UyAa/IuVRDY+4e4PgyGnFuN7qHu
	 R7+Scoi4xIX4Mj9em/4uUw/m0Ey1+IUBnwCE9YW3kCzaVKybBAXt67HECvTtK3FJm2qFZ
	 HMTlP4NtI6uHn+TfDofufC1W3bwXnSeKAZoUPuQMBjC74GSr4HM3bHTC62U0Y4DvIIYlU
	 ph5Ti1QbvvJ76jtolnf+9j2F3jj4+5Pdbqei7jbhoyrrERAaQNKyozYB7If2qblHKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSXIIhvf;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B437606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B437606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LSXIIhvf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so2491485eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795522772; x=1796127572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8j/7x8rOY24muk9yPjpnNTz4+yzbaLuw/EWCrjOA/0=;
        b=LSXIIhvfDUn6KxtqknDVWtbk4AT5uBrpHhNoS11CBzz7o0ujd7HkanuJZDBhs2Mzwd
         5Niv5ww8jtPhybLx9GO3l8F12HU+Hu7DJuthhPwg58Wzvi3cN1i5PG+VFpL21RzXTGAQ
         B+39aBLj1i9uZRrnQ8VzOUP5dytUKRohe1vCUs8AIwvTOQc1CrInIIGcQfd5KPLpVJxO
         ZL5yP90qCMzc+beCP9zDj+Dx9dC9mQMx3KzBPyJdQdk40xO0N1XNikFY2BmPKw4H24J0
         qCufH5NIMwYxh6HpQuvS4xY+Z7VZc+uEjpHRDgTztJqwKaKg4GptrFNqB7W49bgUUig1
         g07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522772; x=1796127572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8j/7x8rOY24muk9yPjpnNTz4+yzbaLuw/EWCrjOA/0=;
        b=ILpV70TV/P7YfVA2pVGVWWsTdeLbjY8lFyYbLSOBUW6reNaw8pPBviYqRKZxTZwi8w
         rAF1qQIAwXYS9U1LbfuR7KCrhGSdrCRGf334A8LWnt2g4UNqGrIbFzc0ePfHwCWF0e7U
         XiL87meatP+5df77pVc27THbPHWPKoHKRz2N8q/3gEaCRE3TybBZq6qXmSzdoNjm2xH2
         lxUgyYOFDYVNKoO1YAqa7bq6IZTQafmRFEFBA+9KooE5WYc3YH80cQUAP88FfvjZRNgG
         PT4ijJ7XM0+RZxgPL3MJo/IdGc80QepOHfwtLH5sCsczVbAI5Tl38PTXJ8BsSSEqamuZ
         T2IA==
X-Forwarded-Encrypted: i=1; AL+hErETU/iTGp5Pg0lVF5bMRIf7vhjd6C7rNSdAgveBD9TwiYs4A6qjMonzRHmgJW0XBvJ8q7KO4Kv8f7OlIt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KfC/RK6oZY44fjm6rd6mJ711arsr4PEiCq/5pJpmyJW1WQxIY
	zuJyyLS4aIkrafpiKl6oQXP+NGwdADu6iYUGpwpt7LRwdM1NeINZv8du
X-Gm-Gg: AZFdTZcEwp0Vi6VsxMENYBypufcZ67E4bxK51IKTA78/aBt1dZjztO91uB6G1XXZSPs
	RbWSFqwNqjzQ3xo4PesdQnwSRWWm8mVISOPONERD0y+B47E9F/HpBWlQrnuZjz4zGbdsoJyaEhv
	eADZ/lCutAWf1PRfl4EtecqKLf5iWhPSk5XqQqHLeiZpOgxp8f2kYbKqMxMw4UifKwa4mERsJcM
	7mZmPgs8lb57oYnD5FavZpA8Mp23hh1iK1Z9xkbTRqXLe5cUB//evnVULf8IxPJ8mq0B8iBcp83
	T6HaWEU0VlNS7lhaSoOgi7n8l9h1JFwpMsM+aXIGhYm0MbfhgMtdI40urZuDbor6bF/jJpm66iZ
	InUlwgvoXTM0S59hyWCA6h8yGL3evmxLRS6wSUdpMH81g9KZHqHULY/tY38f2cUHU4r2e3TTZHZ
	Dj852sw1IcShCi6xcbiqeB8cCvjvxzAcDRmJeSPdQKjt6vNnU29Soyj3+DkIbBtxAERkbhz3q+C
	BrdIl7nSCYZF8ZUZNpb9HnTUdgeQJUn4eNzz9fDCa0w3reG2lrDQnZcNOC+AqRXlFrbNXaYZeg1
	77I73SgaA8sGsqKyaUfI9bhFZrKsnoAhFJrDtiFL/wIlb8Iezn84ip09IfveIcAoaAQHwqYRFIl
	SlqjVlmMO2Kd7YXY8RvcycB8SfEnbdiNx13k=
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr27803686eec.35.1795522771545;
        Tue, 24 Nov 2026 04:19:31 -0800 (PST)
Received: from hyeonjun-ThinkPad-X13-Gen-1.. ([124.197.199.8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm48153278eec.14.2026.11.24.04.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:19:31 -0800 (PST)
From: Hyeonjun Hong <hyeonjunhong330@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hyeonjun Hong <hyeonjunhong330@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: v4l2-ctrls: set handler error if array allocation fails
Date: Tue, 24 Nov 2026 21:17:30 +0900
Message-Id: <20261124121730.1598114-1-hyeonjunhong330@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The control framework lets drivers create controls without checking
every call: a function that fails stores the error in hdl->error and
returns NULL, and the driver checks hdl->error once at the end.

v4l2_ctrl_new() does not follow this when the allocation of
ctrl->p_array fails. It frees the control and returns NULL, but leaves
hdl->error untouched, so the driver sees no error and carries on with a
NULL control pointer.

vivid hits this with its pixel array control. vivid_create_controls()
returns 0, and vivid_create_instance() goes on to call
vivid_update_format_cap(), which passes dev->pixel_array to
v4l2_ctrl_modify_dimensions() and dereferences it in v4l2_ctrl_lock().

Reproduced with fault injection (failslab and fail-nth) by failing that
allocation while loading vivid:

  KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
  RIP: 0010:vivid_update_format_cap+0xc83/0x1b30 [vivid]
  vivid_probe+0x37de/0x90b0 [vivid]
  platform_probe+0x9e/0x140
  really_probe+0x1cb/0x6b0

The allocation was first added for dynamic arrays only. Commit
5f2c5c69a61d ("media: v4l2-ctrls: allocate space for arrays") then
extended it to all array controls.

Set hdl->error to -ENOMEM in this error path, like the other allocation
failures in v4l2_ctrl_new() do. The vivid probe then fails with -ENOMEM.

Fixes: fb582cba4492 ("media: v4l2-ctrls: add support for dynamically allocated arrays.")
Cc: stable@vger.kernel.org
Signed-off-by: Hyeonjun Hong <hyeonjunhong330@gmail.com>
---
Found with a fault injection sweep over the vivid module load path
(fail-nth, one failed allocation per load) on media-committers next.
An LLM assistant helped with the sweep tooling, the analysis and the
wording of this changelog.

Tested by re-running the sweep with the fix applied: failing the
p_array allocation, including the one for the pixel array control, now
makes the vivid probe fail with -ENOMEM and no longer oopses.

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6e751a043a21..12a799824c44 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -2263,6 +2263,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		ctrl->p_array = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
 		if (!ctrl->p_array) {
 			kvfree(ctrl);
+			handler_set_err(hdl, -ENOMEM);
 			return NULL;
 		}
 		data = ctrl->p_array;
-- 
2.34.1

