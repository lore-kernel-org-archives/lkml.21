Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999767;
	b=MUZnHt/lXTaJ3LjNOAftgjWblZ0gp8s+Y/29mjp+rmAficV1p60BYFRv/WfILhPCLcio
	 arsI0doRxJqklLHGNauZRyaLi1J5U1SUe+BvwVun+zp+v8B/po0lT3wOjBameID7826Fp
	 /O7UOvY0p1lPCZLjVtbC3RqL7KGC1IhURISJVzYys7ST/oQBeaoO1sBEm29JBDPf2Ohoc
	 x4CE7BzaIyJyloXd6zCRPEmQXGCxB/HfoFWX3cKLAGazfnK+n8/HUpMHVjujcVTTb8Bsd
	 K+oHvczX1UeQYoJzDHV+omEK4f3y45tdZaX561HnGbLwZIpR3mZTB5VaqfmnoaAmL7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aaVCz9shF8ZFyzO5/5N6GKpW3bexM2Ih05SHuYmSwNk=;
	b=oa1e0jnl8JPfVRvgQ86DJ9wiU3oC1r7EN1qWn1sG+h3OCg9wojqMjII60/6gsuRhDVhZ
	 FlTE9whKScBzD7pmHI0OAs92/0jfzlmHww8oAJQuuLWnN6oKCaBYeH3Yw8b4DqYym0JPh
	 77ZX7Qhg2SJLMsQyP/YpYy3Eb9XqgmXJQKBP4h6q0APyOiW0207qIK4lPI5F5Qo3bE8du
	 lek6oguS+uhIhLAlRxUTttyBS2FC0sVTt/2ha6LhbNeNDnKO/yEWui7+Bc6JOoW4jsCce
	 wZYnRQwUDVjPVgttZ1UeRmGYIPTwLrfPHFjEgb/ttNi3w+Tfh9vvR5QM1Ed+GJhc0RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvz.org;
	spf=pass smtp.mailfrom=openvz.org;
	dkim=pass header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=n219RArY;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850A460A2604
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850A460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvz.org header.i=@openvz.org header.a=rsa-sha256 header.s=google header.b=n219RArY
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a357b1c649so444178f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvz.org; s=google; t=1794999766; x=1795604566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaVCz9shF8ZFyzO5/5N6GKpW3bexM2Ih05SHuYmSwNk=;
        b=n219RArYjaYdvkIMwO9ir3M3eWTlY0YtYTxXjc0cqfUMh5PydaRebzWDnFAhRA1xEg
         4vBuLRpcbhklUVXM0RpBGXT2IFnZI7oiu+3c0j1/JKIEzJ8aOelpykadn7HDCLqescXV
         5I82zgZQO6UKKFmspRCUvQYMeGeRnlwgZx79dSNJZF4L41/nrxTRt0ZmlgTS8tj/97E7
         QqMIZBAKLnaIDFfYN0ssze5vBs2ONVuUThN0JIAb5huBu0Qc2KcEsfGIXGYY7+0Z6VzS
         3HE3sEmEsj3aKjr7T6DTbvn+hkEI2Y/lpVf3oC1QZCdrp8Y25vY2hb01mJPELcfB1EBi
         w8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999766; x=1795604566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aaVCz9shF8ZFyzO5/5N6GKpW3bexM2Ih05SHuYmSwNk=;
        b=cxFuvx3lNZ91Wg62TlgZDDOv+gTmDctJIX9htDsGG+d/IAsrpvwQ4MaZ7VL4twy1Ll
         0jP6yeGUwKAbquWJHZ38IHFUW4vgo/oH7OiwX9xmCWApQ7nXqtpKtqWbrKW9laoDIotF
         K4GEX0oN7s0Gz9kyC4QIIan6ZMR5nFWDoQPzb5qF5wWhZVT8ZFT+qjpGG1IOMW3HrBBQ
         ZJ6UaphKaMz7mtUYavRbGNDEbJ0f1LT6X6wZNVUE5WBkqhvHG+qQitBpe4nTyUu+sAQh
         4mN6saOcruk6tm5YHM/Wrnv5WikLM57R0WcfmRR5O1u+COffAfWmOxKVjCFr/hqAFEZM
         G1iQ==
X-Forwarded-Encrypted: i=1; AL+hErFJkA28ncEGlaQEpC4OK5HsPKr14+Jhtm9/LiETXb6fooOio2L0IqfDaXZyjExxLWbpWisgNM7rvJqfbOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kwx8llNNPyjXchG31cq3kJ5Jf6hDU27/Nc/qHdbxKPbrf048V
	kOtIEOp+H0lqHxhkmQ38e7ukFPQ5ICRKvRIlHHLaqcUTX0X2aUALXbxnGIRXfunYHJk=
X-Gm-Gg: AZFdTZdC36Rv+k5wpwagJtqsLEsHxZixxJIMJUvSP2QlJFQHY40uMF+Sgz5Xn+5k6zr
	+aO9SiZQIGEg3+JNxeGX1bGUlfjPUmQR2YOfGU3EKumUa/eASzYpW+/Wet9naQwIQvGytpeDH+v
	EgDk/T/MVb+2BI89oOksk6Kk41XfDKCYrQrXP/XRQuZ5e+tzMEApk5R/yvpDISQEZRgRxt8p7RL
	7SwjUsr7YUY2TtpxmPcXj2MeflKBcVzXp1F6s4mvt5A2JrrXCg/e+Tlr/GnIigliocrHa2hCn1u
	ho/oe9js/doMiCWxvYH2fGLyfsjga8211oQn04hGB2JOfXyl7+80S9Tw9KenUNyyCrNo3ugAXKy
	ubteh/bJgiwBJ6P3NDQewKF/uVkcLSjJ0f3fKflj0pjZ4mV0l+toJ8sxrfJ872jlE/VZzdEtafA
	D+joFHFhC1x6Z8iW+wjCS1k2/lD6Vqne6ag3i2lXk6Iq6Zn3OMR9bFo7ZJDjqpXcH6EIiCQnZ9J
	VyoSNZ+q3n8Crxo50p1PyuB/K9lrql8K1CTf7TzMdFEiXwqP+ahR7fSHSEcLuzY5YdrlZRZTAeO
	hmONY/0toJclN2pPHheKvVHNV3k=
X-Received: by 2002:a05:6000:40ce:b0:4a4:6669:7f9 with SMTP id ffacd0b85a97d-4a63cd0f053mr5455559f8f.49.1794999765938;
        Wed, 18 Nov 2026 03:02:45 -0800 (PST)
Received: from artemis.sw.ru ([2a06:5b06:b600:300:8c09:3cc3:6efa:ac1f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm3943277f8f.52.2026.11.18.03.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:45 -0800 (PST)
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
Subject: [PATCH 3/3] dm era: construct the target suspended
Date: Wed, 18 Nov 2026 12:02:39 +0100
Message-ID: <20261118110239.2910290-4-den@openvz.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118110239.2910290-1-den@openvz.org>
References: <20261118110239.2910290-1-den@openvz.org>
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
that window is refused rather than served beside them.

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

