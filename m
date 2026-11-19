Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048215;
	b=GSWbFA6sl3ONyJ+fLVHQtwtM7vxRQaNThOSEQMFPjr0Bw3/j0QuovKJwUe1DOeQ78/g1
	 XM9icGLY7jY31NWRXzkFUcSnqBzuQfYJHSqkB3Ulg4vSB/s2IRvJhavSMu2OkqTMXwSkD
	 gMVW6jr5OBZuH+IMy9YobkCQ07EqnHqfDvpE3m2SAtYK+zy3Ui5u4IcXkgTvRFYotLYes
	 vAXHpVHdpzPJLT8eIIsqfERtFIO7vnMpwp+yDY+xUQ+yQ54uJRfQ+04iN6WqhUzdatNSw
	 cVTFzVGK6S+qIbDfzJhaemwgwzWiTUzt4mSmOaRgdMQ93ngVunwt3riFGjz1OVKNVhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
	b=bDJVkAi9NoRlzHRb2TOfRKv7GSwJN9QJo1asB6EcAZ8XuerBRz6UKGjypbAt3e7P6C5v
	 lbnRqcAFYWhR0N6RnMubJ7y0bu/2ugvhgHZveG8znp2G2Wfm/w5M8blKBUiy9SMta6A0x
	 GETw17yBg2Q65cwUP+LlNerY7drVBb3Wd8WJhyMN0StTyQblQ/qJEbAnq7wiQXHHpWqpE
	 +/6tLP3CgJbNpMR31YJ8N+GGE1mIuiHLcBEzt+pCWwajnRHqnWTtKc4XnilVJaKcMeqeP
	 ltYWNXQpeCMsQ0Sh9wH8eJSuE+KioAJ1SexWl+izRAmyZ369wkfyCDjKx8bQ5q/F9Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UG3Eh/SQ";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2B606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB2B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UG3Eh/SQ
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b85c8aedd8so39955a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048214; x=1795653014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
        b=UG3Eh/SQUGCBKdVHe8THw0oF1joQ0Y2EbkldtFzyon8Ud1qfZ0vF/2rOG1imp6Qfoi
         3nsJXuyQpPY6pzvC1NxI6mC/O/aTjVMnen4tckd1G1//jAAaTMzyh1dg+48lNNgoxZ7m
         rTcMET2GtgASluuAmA24qN0JrCrcQ9A0gVze2pVC3lofr5fe7ha+OqUh/nBnpR1DOvXz
         9nanKjn7kn8z1Z7eFpcAirXsfjLAyftZCmJHa/zHCjnQwfmYBhiCXcj/LPAcuXFA2zx8
         tmXPC6sqQKl6MbKwMOs0bNaWEd5ysoAkI/KUs5I/lgvxDF4bnA2JXCLz3KAaNb36nEvH
         IZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048214; x=1795653014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bMRA063A3AaOLf4nBgKeunZjhvNaz9Ho8DKakkM8c8=;
        b=OG/0FL/QK3s0T178TqnUJX+DhfblDybWE9YQ/9afuPBH1r1Gq+qGY4FzelWpwVTG8p
         D8oEr9STTSvSIW3WTJ7QE4MEq59+w8GQcTXH9ztYY+MYB+z9EHEpHSLYv5+Q7QJ7TBN0
         JZWZXIXb4Qpfx5P6Q1SB3KK7Ak/F0hT0jHBOl1GMfhG4urA5ggdFohuKniWRjOc15svB
         UjgpEWe8O8UfBvu3SUDPcyLZGAIHlYXhpmMXfSeynpG5KPb+jgXrIKIvLiMT28cx9/+q
         gvoumenWrO0EFJOqoL8pu5u/zXVyXG3JJy0F+gr3EW6yPM7xgJGagnY9jiosKV+WnOck
         9MNw==
X-Forwarded-Encrypted: i=1; AL+hErEliN7cVTbMw0QFrt6JCyQc2suRh+lL0Ws7vFGiLwu/R9i7TedeHVgI8rj9wLLrEETn6RyiBxnz/nZ3QLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aJrsymV7BhHgpz5U8GvRoTNrZcXwchpECh3xWmPUuuP6+OKis
	ffd15iDkPNIyW/m/721ISqMQ2tcekngVZV2pWyT/Ks2bEjW/G+I+uXsU
X-Gm-Gg: AYBFou1Fz2q0OntLvK1jOasVeWTM2+Nr5bRCLw0UvBx14yG/YWPiZMEuoOFFcjJOXue
	cikaG77s/tG/cV34Hl1LeaXe/rFotvVvh3/sQb/s3QzvU+iZ8fAhevAACRD6AMzGPI/1ks+OXxY
	uBnq8gS1b9bpTk8O/B0CdM/mgTBvCpDMsSp08V3q9hyOyaowc8O2uls6X0ULdu4wq6WlGYLzjJ1
	TQOR7fNsGpyc9VDGyCBavmXkyjcgcPoFWBW+zReYKh+QgnQz8ZlPJyxbpXMCGgOP4WlajFWfC4O
	QrJXZEsN8dyHI+Elk3kaAeABcKQ2Jr9hdjOTLVcXmFjM7U1+3Lmqm51UKnJvHm9k9CkrIOYwnuB
	nwrK9ut73JzrMiVvVckF9moPk5UfPE1NuS63P1PMyKLfgmGw77dfMCNzkTwgK1k/IExUqJd8M0u
	GFlpuJK5LA1zer5wmaVCahWp3yorHm9yBkVXYRCcgy6lQdUQQ1waNXHNY7EbWBnlE3RO2HzPtyV
	YwhKrbeYgxCODVgpSOu72EDp57lSsn9ug0VWJA+LNN0s07hdaaShnMCCM2TMhCiCLq4trzxQarc
	gpOu9a2lp5CIRacIEqhMOIM5EDJoxgu1okAtHQl1GwWhOiFIiwrO+A==
X-Received: by 2002:aa7:d152:0:b0:6b8:7d2e:838 with SMTP id 4fb4d7f45d1cf-6b887c69449mr3774897a12.1.1795048213632;
        Wed, 18 Nov 2026 16:30:13 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:12 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Thu, 19 Nov 2026 01:29:59 +0100
Message-ID: <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 3 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once earlier patches propagated test failures.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

Changes v3 -> v4:
- Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
  lines within 80 columns (thanks Tianyi for the review).
- Add patch 3 deriving the invalid tx value from the kernel maximum.

Changes v2 -> v3:
- Add Tianyi Gao's Tested-by to patch 1 (thanks!).
- Add patch 2 fixing the remaining three checks.

Changes v1 -> v2:
- Correct Fixes tag to 1ec2230fc721.

Omokefe Emmanuel Onanaroghene (3):
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status
  selftests: net: veth: derive invalid-tx test value from kernel max

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

