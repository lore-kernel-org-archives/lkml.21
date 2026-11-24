Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523169;
	b=oF5QVZ2MayOsmyaxIZr/V+e37jWogw3r04csHPXtIk1YIe0QAUEnZcKZphLhHAW78KDx
	 juHswwmFnbyrQKsOO1WgdPpVPCoG+gNWe/dzjAFvz3HDX3NhgrDqO0H1eBtKzuYhJKgHy
	 J3drnrbSVkpoUdVclvtSB2XQ7ex0tMjA47tzDCQSDBwX88aIN6T5gnlpfIoj8qc4qHtP1
	 7y06PBrDlIPNrIgVh+/9asOjl1LrNDWRhXZYpYC6E+fkiIBXCXsac4phttwJgwtyHm7z2
	 tMR3mnwdeCHLBEUiu6TP4loVcSrEKJeC5DMOFmq5Ybh0TFgkK2RvNn/F0cE5hVE1f1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nKW0ygY+ZRbJKMAuc0hDt6Xe++SkVaN6uVm3JumCZoM=;
	b=XAL63Kp9YjWsdbSXnKTGO7bt2ecx86yxHD170oqOhCTLEV7hJ7bEN+xgNaTYRu/7ijav
	 xBT+ZZhgoQrow27berv8rHTLsem1yK+IGHjVgChIYcOyY3+hPYLaVsPlBiJRvzk9MwX7i
	 +fjCAMNYGgwpKuGIwrbohJTeq6mUIZDSL4n3YXVujwoAKBOwDdmdepti8DQlTLDzXPV67
	 pqI8i7lKblMkBdpIdZ5UFY7/rfKfBcEDoEeqWQ+a33sqKXkw49mU99KM7ePrzNEe18P2W
	 5Zm754uvZNHG/Pr4snyixF9PJSfftmJFCCZ9saWyqxNUUWs//a34PiO6xrjp/rhwT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=tKsozG3D;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C3B606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C3B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=tKsozG3D
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so42236455e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1795523167; x=1796127967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKW0ygY+ZRbJKMAuc0hDt6Xe++SkVaN6uVm3JumCZoM=;
        b=tKsozG3DPZnKEC8C1kLIQLx5+q/vUa30SOR5/TtDRKjHzULqVm+dWBpaXWQ825sQPQ
         kOzqAR091dtWkeFbNfLi+ssmxomoV9XQbNS7DXVH0/Gs3ErF35lDjVQ6Y94czOVOGT45
         FrJ6UXXPL+C2FEC7dVL+4vh0A4T/B1F1GzK+kKt3tOTNeTE/BKHHDsfSgOxCYBp9Dt7+
         BIeoASMRWi5wR8DcfM2/Hi5XGRhNR50Hrqy26saV3McDJzdzETW4iOCUhFjJY5r8VPJ8
         teU10v15potRLzyAM4KI1WYU5kwoBoii2ZvAkyvYJCnOZG+DLIVeipMpw+lQJIdfr5f3
         j4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523167; x=1796127967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKW0ygY+ZRbJKMAuc0hDt6Xe++SkVaN6uVm3JumCZoM=;
        b=yQVdzIlPIQr0yOAJ9Kn1fKymim8laSwYnmXTsfHfJPJ8PA4bgFjHOCDmL1gpa9sJ6r
         LTwvCH8RkSbf27gss1iEZEcrb4pU+M3zkXRz4M5jD8jOKrcJKeOhBQ40c5Z/a4JJ1bv9
         UuyciLWTZ269rHtBcrUsCKieaDWoSHUfgVokD3vLdZQStIVEr7BZBH1UVmYpnHyDIqsR
         L1/pF9S/6l7oD2r94Ph02QI5CYljlNpEMqpj2FPrywcWVqttxpthOqMIx/39eMBPQ/XR
         bHEYZ4dO3NaCSe57Q4KrZk9iMI7vsmGdc2JK97xwgtQzYt8SJtDYxZFMpBDhyP+KDPil
         Y/0w==
X-Forwarded-Encrypted: i=1; AL+hErGCArnXFaljsZOmwl7XpPA023XjZ5bOnOEODb1V4jjk7UfGmIHTFukpFAbSfeyEQsi9JWM+rtGIH1ussHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RRHDSD/oWKkpYfKsi0bjteECTpAHtbtNpKdVvMTuwqktQPcGZ
	ty4YTam0WPovbilybZXmNAQomvR9nJEzmde9b8fW7z0955WwyhFwDP649gwgckLLTh4=
X-Gm-Gg: AZFdTZdxsLzGCX07WfqfE/zA1buyrfWkHsLP38q1PAVRQ4M1Ay6GmFHheZP88Yo5QcI
	/Skih12MQUJ2U7joj7TPCI4mj/49YTyV9RW9YKEDT0oGf9C7GQBcitfS3GmlBBSfYktvmvWqFrN
	4/Uw5zK7XgxOM7YFjMl5ELkkWk6dNdU1E8sPtm9jRzJx5CZbkgMffUN2pnksOBFcTLGZQNB0agf
	0ufYzMMb7sYrsdLKxiyy2sDBmbXqaK/co2T55sB35lws5SpWm9/jE79J/+0Qj7G/jByK2dxkTAM
	q6inMUnpx2vC0aZmE2/mDFJRKm43u6horBeqrdHZX+yFxR+q6bR/V51ZS1TKRxmaze9GG6R0Xh1
	OCAk+9tv5zfnV2yL86JeXEmeJyiydbELyxl4sVvczdxa0saq+ijUa9DGzPyCu9f0DbjOH/KKOph
	eFHuVpzRTwpAe7sMIrMu9tdPmJa3+0lCG7k7HUnkqEMEE5oJ1bATQntIi1bVOFrlA8n8wASfDjN
	ix0S0/XSqn4Yg8njskvEQ3GoFg8QCZ0EFo4gwzKO76UaT4y8mxsdtjTxxeFmSzBZg9S85NyBkrU
	5q0yOKjaK8h4Ny28ROCzPhKuLhE=
X-Received: by 2002:a05:600c:1549:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb887e0699mr301232885e9.2.1795523167182;
        Tue, 24 Nov 2026 04:26:07 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8dcd:31dc:bf64:9564])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm423615975e9.15.2026.11.24.04.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:26:06 -0800 (PST)
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
Subject: [PATCH v2 3/3] dm era: construct the target suspended
Date: Tue, 24 Nov 2026 13:26:01 +0100
Message-ID: <20261124122601.436965-4-den@openvz.org>
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

era_preresume() resizes the era array and commits the metadata in the
thread that resumes the device, and starts the worker only once that is
done. That is safe only while the worker cannot run, and nothing makes
it so: struct era is zeroed, so era->suspended reads as running from
the moment the target is constructed, and an rpc arriving before the
resume wakes the worker alongside the resize. Both allocate from the
same space map and take the same metadata block, which corrupts it:

 device-mapper: block manager: validator mismatch (old=array vs new=index)
 device-mapper: space map common: unable to decrement block
 device-mapper: era: metadata_commit: pre commit failed

Every commit after that fails the same way, the target reports "era
Error", and the writes it tracks fail, which takes the workload's
filesystem read-only.

Userspace gets there without trying. multipathd asks every
device-mapper target appearing on the node for its status, over its own
uevent socket, to learn whether the target is a multipath map, so a
target is asked exactly while it resumes.

Mark the target suspended when it is constructed, which is the state
start_worker() already assumes it is leaving. The resize and the commit
then run with the worker held back, as they must, and a status query in
that window is reported busy rather than served beside them.

Fixes: cca2c6aebe86 ("dm era: only resize metadata in preresume")
Cc: stable@vger.kernel.org # v5.12+
Signed-off-by: Denis V. Lunev <den@openvz.org>
---
 drivers/md/dm-era-target.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-era-target.c b/drivers/md/dm-era-target.c
index 29b0602e7849..d40a98169b04 100644
--- a/drivers/md/dm-era-target.c
+++ b/drivers/md/dm-era-target.c
@@ -1557,6 +1557,7 @@ static int era_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	spin_lock_init(&era->rpc_lock);
 	INIT_LIST_HEAD(&era->rpc_calls);
+	atomic_set(&era->suspended, 1);
 
 	ti->private = era;
 	ti->num_flush_bios = 1;
-- 
2.55.0

