Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523167;
	b=iY6em1w3PmiCGInZT/2QC/fP8GhgFARIrxDacWy5s8+q4y3lVoUWo6O/VTMWJqGz/lF8
	 yy8/ZNs1CsAU3vxCQmr9vfi76VawzjHIq1sLLziUq6NDIZGqc9Olp7fz/Cm/T4X7IYxXj
	 0ncWi0gO9Jb7p74W2C/wVW4Ym0k7nW61Ngud6TB38Owsh4UIAmNcN75T6l5ZeVpeL6C8M
	 P516J/RN6DzrBG4UkhEcwmc7FMOWJFNZIeeyK3BrSZOcBeR4qpl53Xi3biyd2vF2uBuIS
	 1ye+uLhlYzQ0foVd7AIFay9qxcQi0HA9IRWDuPkcyr28yrI5KT9Cf/932fOtApMmGyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gt2Xoct00o0UZmPrmLiXkNLZXaxGE333WSwLDI5A/G4=;
	b=kmE7YPuz0B/v3lyKWCPyUfy5OSiCWDXLLwXRg1wMlFQiR7yqTvZUymyeMbr99SklWX8L
	 6RTPFRGrWp0gvQXIHjhFJjCkeW8yNTsfbD+xJduM1uGa/nCLn88gBd8QXvU6/maSijyes
	 mYi6BgKI+W8nwoJnBTifAICf7EOPIzENUUl251UjHcTngcGt5TafPq2NUHz44DajNPIJG
	 hJxhIHegIdSUG5VOqX6SmrIv5OXlASKHjuz84Tmbb+JZbzacawKO9efIiNGtESLBi/vYu
	 mq9+WysO9jD5Yvtm4Ue/sVNVOj0egDf/9jpwa5Th0OmHb6nyQ5jkMNutt25P/RqrAEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=UWMC8bMa;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94130606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94130606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=UWMC8bMa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso41203705e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1795523165; x=1796127965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gt2Xoct00o0UZmPrmLiXkNLZXaxGE333WSwLDI5A/G4=;
        b=UWMC8bMaLapIJoJXGBN6NoWm4BvQ6r+qGs4p6Q6/V3wRMXR2rk8I/HpxLH2Vx5TRQE
         0aOIasCXpKA//HnW1Tb8oIMmKF27lVEoyMC9eJi8PoXMgN5ZzPZMdvdcDLe/zGWMZ4W8
         1gxztqf3pJkHQm0f425LQI9pZwNriIrTBYwMzwYc5W1Azwbp+pngWHXephcEACJdWvuF
         6yzxHNBCIZiorrbmMpoUlyNawdWN+qf3WgKZRZ+Z9JLsAwIwZtfDg0aM0rRYM+FxuNOx
         2ycGN1Kpqu0E8hNGVDr8jGXfKdkekKEtCBYC3cQIm2Xj6sX86pwKkHwg7ElM6RaPtDV3
         Zdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523165; x=1796127965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gt2Xoct00o0UZmPrmLiXkNLZXaxGE333WSwLDI5A/G4=;
        b=PZfT7/aJm+ugI8/VfbQ00UeT6pBY8M5yXvuIvVJPXIFCmsvALZ7gHcjejUAR3Gs0Hc
         7WjnEnHvz0PFcKTbJwj6T8YbXjoZx477yElmeA5oCex5WZusx0BHdbgsfx8nMMfx6gUW
         EO5iIE/qv869PV0gihGogeFSfAqAH6kg/jF96KXL46ssMMiIRPbn8ISBc6ItarZ4vraj
         yw3pgHD8cqITw3ObSH2Xi8zZCx7xtVMCbOILZRfeXUvEii+QPvOO7fVgz8txyUSjW958
         w6JwLgoA2dT1hwAO0ilcFzlrrSsR4JL/MH216Z4KOC+HAZSTIZAVaUr/GoReRASUSkCw
         /6QA==
X-Forwarded-Encrypted: i=1; AL+hErGXo3FxOvzgiWqPT1fi6nXV2I1PVO6sHFSWxRIhb0uUR419/f9GTD6Ju75koG8epY9YbW/qeut28ws/GWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OQmc33qCTVy9qkxKMJ8IW6SbQWdc8xusvDFHGWyjUsPEIuGaC
	ELgha40K/W32sKagbKLJmngygMYM1BO9yquS81IMD49Fq4u6nBz2qcJpp3sgtekPY5A=
X-Gm-Gg: AZFdTZdeU4hrLzo3ztHroHW1te2ToGybvpUl973fpd8SixzwnTeMiux8cRBVK9kBlm+
	oYBvHd9aym+wOQEYvux1k40Lv0iru0HiW2rvLUU1oU8dWHc32v4ggt6bnJDPvnOfsdWQGva0FGy
	Pl4gQ6+mLipkD7Z4PtE6CPacrcpnfRcRCrkAPBQLeoIWqVIA3/hccRRdBe4t//sJgRpLLjLUDZp
	UAbvh4N/KKDFnJIp8w0AuQFmALBjqctjQYGms7tLht6+32ml196Rkw1rSmxmMXTfmCoP/ZBpTaX
	r0ZUF5DQMGoXgQCx0bOOuY6W9GDudihudgfAbvMt5nNbWmoaFiQ0tmavkSNEK4/YpCImR4JvhGb
	Nipl03pBO68l/d5Rgu5+6J8lzNuziBCKpbqkSjjqYF5pQY2a+7QCqO7AmSwTp+Uv5FZsZcUuJyh
	18XfK210K7GWw31cqEDFZh3y0XTkQ5rFaTWAJwjbHC3Y8FM1owx/Au6RZkHUa3XT9Em8VxZBigm
	/HWutExMsO5bNfVMWQf1ev4XihR4ZB5SHOS7mB98sUYn2Ue/LUPwK4eCH7sR6yfZptAK+ZHHrWB
	ESwio7glR+yRbc/gEDUqPEBocZA=
X-Received: by 2002:a05:600c:1c08:b0:4bb:7757:fe6d with SMTP id 5b1f17b1804b1-4bb88804c5fmr364836555e9.11.1795523165066;
        Tue, 24 Nov 2026 04:26:05 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8dcd:31dc:bf64:9564])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm423615975e9.15.2026.11.24.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:26:04 -0800 (PST)
From: "Denis V. Lunev" <den@openvz.org>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	dm-devel@lists.linux.dev
Cc: bmarzins@redhat.com,
	thornber@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	den@openvz.org
Subject: [PATCH v2 1/3] dm persistent data: put back the reference a failed shadow dropped
Date: Tue, 24 Nov 2026 13:25:59 +0100
Message-ID: <20261124122601.436965-2-den@openvz.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124122601.436965-1-den@openvz.org>
References: <20261124122601.436965-1-den@openvz.org>
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

From: Denis V. Lunev <den@openvz.org>

__shadow_block() drops the original block's reference before it reads
the block, and every error return after that leaves the caller pointing
at a block the space map has given away.

metadata_ll_commit() shows what that costs. It stores the new block in
ll->bitmap_root only when the shadow succeeds, so a failed read leaves
the space map's index root at a block whose count has already reached
zero. Every commit after that shadows the same block, fails to
decrement it, and fails:

  device-mapper: space map common: unable to decrement block
  device-mapper: era: metadata_commit: pre commit failed

The metadata never recovers. dm-era reports "era Error" and fails the
writes it was tracking, which takes the workload's filesystem
read-only. A read of a metadata block can fail for a transient reason,
and one failure is enough to get here.

Take the reference back where the shadow fails, rather than moving the
decrement past the copy. Dropping it later would hold the copy's write
lock across dm_sm_dec_block(), which starts by shadowing a bitmap block
of its own and so takes two more locks, and the targets size their
dm-bufio reserve for the peak without them. commit 490ae017f54e ("dm
thin metadata: THIN_MAX_CONCURRENT_LOCKS should be 6") set thin's
budget to exactly what rebalance3() reaches today.

Fixes: 3241b1d3e0aa ("dm: add persistent data library")
Cc: stable@vger.kernel.org
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 drivers/md/persistent-data/dm-transaction-manager.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/persistent-data/dm-transaction-manager.c b/drivers/md/persistent-data/dm-transaction-manager.c
index 7401add01d12..cf203ebb5110 100644
--- a/drivers/md/persistent-data/dm-transaction-manager.c
+++ b/drivers/md/persistent-data/dm-transaction-manager.c
@@ -303,7 +303,7 @@ static int __shadow_block(struct dm_transaction_manager *tm, dm_block_t orig,
 
 	r = dm_bm_read_lock(tm->bm, orig, v, &orig_block);
 	if (r < 0)
-		return r;
+		goto out_put_orig;
 
 	/*
 	 * It would be tempting to use dm_bm_unlock_move here, but some
@@ -315,13 +315,18 @@ static int __shadow_block(struct dm_transaction_manager *tm, dm_block_t orig,
 	r = dm_bm_write_lock_zero(tm->bm, new, v, result);
 	if (r) {
 		dm_bm_unlock(orig_block);
-		return r;
+		goto out_put_orig;
 	}
 
 	memcpy(dm_block_data(*result), dm_block_data(orig_block),
 	       dm_bm_block_size(tm->bm));
 
 	dm_bm_unlock(orig_block);
+	return 0;
+
+out_put_orig:
+	/* The caller goes on using orig when the shadow fails. */
+	dm_sm_inc_block(tm->sm, orig);
 	return r;
 }
 
-- 
2.55.0

