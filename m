Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848766;
	b=11j5423+0zp9zH/Gq2VJdAlZxJe/l/5AptiyMTRThPAMl0MGDz2kfvqH3U5PSdyktM/P
	 kJh84Hfqy86Wf6ueLEQHD+/tNg5O9rMbZkpWeLbEYtBWRCf0Ed6V2ku3XqeLXjhnM+ZG7
	 LZojqhCpO7mqvfDxvWpKon8hP+9PRjPgRH/+hx7+gmvvrw4R8QFsbCp1e7rbiuOjmX1WO
	 DIDVLT6C+rXL9ugimmk3iTZweewlZGACObDTE2nW5C6l9iRsP2LqM+EMbgAQf2radPklH
	 H4gwc2Lzk98MSYPo9RwjsOAKz1MqgypzWHcGTCIIRT36nDz7JeuAG0hE9jNUhviZpIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
	b=MgQ1LzoVJ9Xrk68sQ75QvPgDZ6r1K+ODpOPCc4P21aqGA8s+J+mriMQGr0o88EXp4kOP
	 6YGByWOrNTJeNWYjPm93v15YbkTCMn+wz+esCxTQUHKQb8Q++TMdW+cG6LujsUdtRDm06
	 fLGlFQmnmlpS+23kNKyMlpiQXvKPcMeFV2yC/0eMG0AyRnRs0Yyd6Z9S5k5GQXGGH9A1X
	 rslNowXv0J2YsRwsAFl1i7jD+fKee29OrgwTqX9W0DYbUMM2C9fGvXTDnljvDrrG77Ziv
	 McG2w5XHd0HexI4M6pJjRjW4Te+2hgCPInpwocAIYeB5vgqe3GXpTUryLvZ5/AHP5wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZ1qEx2;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32E606A332
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D32E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdZ1qEx2
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so4082106a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795848761; x=1796453561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
        b=SdZ1qEx2enr8skg9XEiVFJKrMzA/CoIp4Tdf8G7PXLIVHgrZ9gdtycHXK1ZdYFjHAS
         QcZjfmhedQgzEy30NJXxP/7+qUBajFXACz2S1fGK07dUp1c7gB16v25aiipi9vqvjzl/
         y9CVrMW9RIoYvKe/+qUX7CdeLuQk4caTY8Ok5+N8nB4Cf9+PlRzC8qmwwmtCEvjJla1D
         1OOQQgcz2dJ0koDQMJVtB2gvm8065Sj1F4LH+uXCd/aaM6GyvQ86zzDF5fFalCVg/5QJ
         I+574/mH5UFK8SGcy53w1PzCGJg7NOpkmG69EezcbFFkj4CJhc4NhjXpFkdpiwn7yvuD
         OWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795848761; x=1796453561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ble64br97A+47+OONyEcJbI7jgmlLrB0p0v7ulwPq68=;
        b=f8aI52bn4+QGDf/PG7gvG8WE1fQCcYjcQYUdvy6g7H2/CGJFe/5lU5wbo3frKfuyDm
         vmNw7ccKFAmIway+NwKgml+CfWmXyT5zD3Hq5Qm5CTfnjLbSS58s7tufA7cEGQdhS1th
         lEAEMpjPgjnPxTO2NEVp55qxC7RV6yUP3EpllF9IvQg8Iz+dV1pvuvyd9LBiBBGHUQ2J
         v2aAdXDipvI2f/UR0Dk9KXdn0bt3XbapYE1F/wWSZGvRKTPWEw4tUf7bEdNvOfNDLT9i
         EOb+TWukJ5PzgPRAjcjQOtLqX32nSyfQAAKM7WPXAgHingIDluUwiDSXjMO7D4p/c1Om
         hzcQ==
X-Forwarded-Encrypted: i=1; AL+hErEnS9MgzwSvXXMmZKJ3jIypXBFgjGMb76XzDlduB5XVledUv/1QF7n5I9zmBINxj+fANVKa8uZyq63fiV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uHygbNFDkF8LMwKzJdVhtXgg+9RQcNiIpQu3fbW+ddSlcEGwn
	33GYCWghxJYqZlRFu9w87NEFQnVimrEMUGsjY/dwSJoHtUTsm++CPec8
X-Gm-Gg: AZFdTZeSUULNGztF7KVqzXLPIblbMuYXEkr/zNeP7Rn6uMaHjZ/qgQSCehkIa+jWlUb
	PA7q6jZkXRUjlDuG6+YTwd3LYWNx6hsVFwEX40dFDcxEKAgwlk3JPC/Mr9XUlsQiQOs2ZydqanX
	znzo9CC7oWYMn/8Sbe5ox6It327mOVYjRe0m5EzoP36Jc5sdcug7vmSl3qkSPS/6r5N8qtD5KBM
	PHspc2vD9SYbTf7dcjRuK1dnNPPIEguGSMdvXuHBAyD+ipuh7MRKpqPmjocDNguyzBPQ/El+Qt4
	IM+i1hLULqSrofugKz3RwRQ0empxthPpqqPoU0KJ1Fno3NwJatx40il9U1wy+43nyiToQPtJTuM
	t53WaxaSTvxtZV94QHz7KrKnKKBnSX8Sk5UYMaiTTtvGtOk+NUFNZLxw3rDHnXuOpMNmTzT2lCq
	iWZbD0iRCheVDFMWBNwZ1NzF9n814Go3IDlz/0pywJjQn6Slnnpv6Y8fw59vsJ2ISr7okb0LHJA
	SZRBbxlz0s1gE6qDOhYhts1oRTP0khVQB48BBaPgOooe/6LZtAQ3/Z2vXaAvL9JlKIoUI+r+Uti
	fXoYP3lnSApAuGa3SaAgRHFoBxatQzV08deo7UTsuyodslAyp9RilL8YqCRHo9qUHyq898bb9/w
	wk9QIEsn+hCccdUMzsAMr1EZmpwSs/D5CsHOx81ri
X-Received: by 2002:a17:90b:1b0e:b0:3b5:3606:f7a with SMTP id 98e67ed59e1d1-3b536060fa4mr5474722a91.1.1795848760623;
        Fri, 27 Nov 2026 22:52:40 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm44372965a91.11.2026.11.27.22.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:52:39 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: perex@perex.cz,
	shuah@kernel.org,
	ivan.orlov0322@gmail.com,
	ben.copeland@linaro.org,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH v2 1/2] selftests/alsa: Add a config file for the test-only options
Date: Sat, 28 Nov 2026 15:52:26 +0900
Message-ID: <20261128065228.3628550-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126035526.1779288-1-sammiee5311@gmail.com>
References: <20261126035526.1779288-1-sammiee5311@gmail.com>
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

Some of the ALSA selftests need kernel options that a normal config does
not enable. test-pcmtest-driver needs the pcmtest driver, seq-ump-test
needs CONFIG_SND_SEQ_UMP, utimer-test needs CONFIG_SND_UTIMER, and
aloop-test needs snd-aloop. Without them these tests skip.

CI systems build their kselftest kernels with make kselftest-merge, which
merges the config file of each selftest directory, and alsa has none. On
the KernelCI arm64 kselftest kernel CONFIG_SND_PCMTEST, CONFIG_SND_SEQ_UMP
and CONFIG_SND_UTIMER are off, and every test-pcmtest-driver case skips.

Add a config file with only these options. pcmtest and aloop are under
CONFIG_SND_DRIVERS, so enable that too in case the base config turns it
off. mixer-test and pcm-test check whatever sound drivers a system has,
so no drivers are listed.

Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 tools/testing/selftests/alsa/config | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 tools/testing/selftests/alsa/config

diff --git a/tools/testing/selftests/alsa/config b/tools/testing/selftests/alsa/config
new file mode 100644
index 000000000000..23ea0ccfdfa6
--- /dev/null
+++ b/tools/testing/selftests/alsa/config
@@ -0,0 +1,7 @@
+CONFIG_DEBUG_FS=y
+CONFIG_SND_ALOOP=m
+CONFIG_SND_DRIVERS=y
+CONFIG_SND_PCMTEST=m
+CONFIG_SND_SEQUENCER=m
+CONFIG_SND_SEQ_UMP=y
+CONFIG_SND_UTIMER=y
-- 
2.43.0

