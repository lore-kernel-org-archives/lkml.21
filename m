Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948595;
	b=2+k650ijD4KIXsu3Znao27X/Pc3MWHzDF/yoxG/bXCKVFVkYlI5uSDdiuVJWSzu3XXat
	 kqD/y67ly0dRaGVGtAxUaFdlCFF7EG0NmHPUOKvLswrzzsPpYxjHDX5eZENmMi6GJag7X
	 te/undRNi+XFj0bpUjzylaJRaY9DCiygu4eAj/XltODX7yFfnXhCpdkhRtwCoRI/08Bwh
	 Cck3P3WsiN0Jh357uKNT22PzCKHthplWVufvIt2FwBe3pOU2bTSBJgJFuF+9Wx+tTzBp4
	 moCuTSKaxwJkBHWJicblXctjyQSoKucaZmdN0pBTV7C7LV+90d8TiCUB+6NmlB5D8fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
	b=zRXKeF5EzvIGa55EsIIQDe5DQnseshJkb3VO98Vh2jGYV9d5Y1FCamhcdtLfN5aa24I8
	 NOHY93wSUO7Ie3Bvyrdg9uBi+GwmfzoMcmMhzMXXhndOZeGRUbAKcyhiKA5ZL9errUq3p
	 DRmDvqn4WCl1UMlrUQCW8/5WBbolJMl9zxrFEWFB6RuZ5LKGfz60HnEGaixtVRL2fzP+2
	 4lh7vat4wIR/cAPrgh+0VorVGF/v/CB9mGVONNwZ4HYQ5BU56tauZHUTRHgCbx88jWN2o
	 awUhqxe9GDwyWE0KvJlc5lqJxo8omKNuveA16YF+2tOt/tMzh2WGcwPbBZQoaLeqL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6w9kSFA;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E20606A880
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E20606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6w9kSFA
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso288080eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948594; x=1795553394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
        b=p6w9kSFAa3KeB1tx66Z35R6AkVkJ5TAt2zalrQE5hGVByehQEiaD7lmGJqJKqMpIEW
         xdDcURvY4k9dM4CyO4Hx77BTY73icie5zXztp1wJB0HhbGZi8Ey1PcGTh3vsEtr1FF0M
         dt9qDU5WmCGpmFvsvPXhzHpP2c7CKTmwSm82gDwJSvIOHMKFoCRY2/IKpbekyvuTkhGo
         gnqKH5jTvGJ0CPnzyk5CG8yfo8kzmlsqueHeCVsvZhRMSWD7ZSqueo7TLynvch4Iywa6
         6dyBMy2cUJDuMmzYbbk+RoamJSCmAJldvwY7CPHldR2H5pqbZqxNEMLBE+OXFkq8yuwn
         4FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948594; x=1795553394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsdvpJVQ4ynQwMkb58aAP0PxU967lp2zLrg3y5n21PI=;
        b=SdfFYsRhhuUaADHnWH44kkRHCJ3fK7BhAddklNLsXCwc8ogRaz4c7YvkaKdRZCBPtf
         oKFL80IgBXHvbYdmY1fxH6jQBJ52HSyAE1d/LVg1tbGsQcbmJsqUj8fPMx5pjaSnON2b
         9x5A8TJJbFrLTh78XnPddmafy4pdA/U97C2gGk0Dy3p6vqANb5iq15dGza+Z+9EIHosI
         FBryus4GITCnJGsEyrkN2gfJZeDeRkvGsmdBf/mTA2RRwknnn1eXrfnU9OeKje4D1pkK
         h8M/Xh5rBJ5qCrSXAOZ0nGI61h2VbLMPMjxDxUHwYUYv8G/765NWelPuQMQudztzf9Y0
         MF3w==
X-Forwarded-Encrypted: i=1; AL+hErH7eG/J//Zc5nC50TRlLjameO2wT1l1pJNkknHQgZHv4/9eyVLpg35EofKRAafXv/N3+grWzRU58Nuaww4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cHyNXllFKiY4OFwKYiLIjg0cRybtWusXHTgl+uf6GC+LXtpSv
	9n8lSlkoX9aLIaotxp5hKQpjexz2zAQrcxC1hdI7BrtHYZiQowX97P2V
X-Gm-Gg: AYBFou2VhbuM6Rcevn2AXo3rr6zXWu5dI09wey68Qa4Fe00Z2Uo4V4rJ1O5JqkxfD6n
	IWvCMoSrMsFiwA6rmdGlu8Qzsbk45e5V0EfIuvRf2VWycnuju3C0FWhZcrkqRv7IFeS1eL8rLDG
	7Y5aKF8xw1y6dwWTOfFfccpU243ZGgV8FalEsAQYGdmHK6VsKS90fiSC011ivbxXSw82p2qIVQq
	xi6kY4rgGJIo+OY9fzYX3QzPxwiIUQki5YC+Pon3AHmxow1E4ecooV5L5gtbN2NFV8vFyFdhYB0
	+JIaW3d2eCE9Xs8lI5HKPQu7XjYHN3pfgmG91izW21TVaycG7E2jOadxkSELg/4GRyh+hkiWxtf
	unxzG3qGh9Bo/qqlteFAKPMQPIvyyKZ/6NUEDRNPDle4eHUkyNqQ8j+2SSKDGOcFG2NGwRB7d4O
	WmMfvUr6FBlY7h+P3b/aIFFv9yL8qqwzTN6QCd9oHcF2o4rPVVoV76//1IGbj1Om5jm3FQFHVcD
	XeL6UHzzUaUJ9er1IsgVFMpAobQufnycpBVmRETqg/ld2I1Qm160wWPoRejXXqcGpPj7XByklqW
	gPkAOZwquBR+TM4GJYdJSzSl2bR6FlioDYptanugPYQV95hSLeNNujhY0egrWZ0yoxsIuVRlUdi
	WiOOM8N9A7Fr1r9OTSx5e3X3j67SLMTSTSfC5fg==
X-Received: by 2002:a05:701b:4291:10b0:1a1:47b2:5512 with SMTP id a92af1059eb24-1b543d0cefcmr702286c88.26.1794948593763;
        Tue, 17 Nov 2026 12:49:53 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:53 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 1/2] media: iris: check the packet size after reading from shared memory
Date: Tue, 17 Nov 2026 20:49:44 +0000
Message-ID: <20261117204946.21359-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117204946.21359-1-dennylin0707@gmail.com>
References: <20261117204946.21359-1-dennylin0707@gmail.com>
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

iris_hfi_queue_read() takes the size of a packet from the first word of
the packet in the shared queue and then copies that many bytes, including
that word, out of the queue. The firmware can change the word in between,
so the size field of the copy can be larger than what was copied. The
gen1 response handlers use that field as the length of the packet, for
example to walk the buffer requirements in
iris_hfi_gen1_session_property_info().

venus got the same check in commit 49befc830daa ("media: venus: Add a
check for packet size after reading from shared memory"). Compare the
size field of the copy with the size that was used for the copy and fail
the read if they differ.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..5d3315f71623 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 			       qinfo->kernel_vaddr, residue);
 			new_read_idx = residue;
 		}
+		if (*(u32 *)packet != packet_size)
+			return -EINVAL;
 	} else {
 		new_read_idx = write_idx;
 		ret = -EBADMSG;
-- 
2.43.0

