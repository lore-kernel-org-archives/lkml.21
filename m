Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555029;
	b=1n61WiaryE8qjpl7rWaECo0ZBfojoDN1MpWlqf87qQ/+1wTZLD6UGYX8wu8bYvhC2ML9
	 0FcDHCnKnr2eL9ASBRcSj6dzfNiqF9eU3irIbQM+/2IQO6Gcw9h8vOGDrioa8I8/PQXrA
	 8S77PhkTx5Q4pm+cjDwiv52ktBM03OWAi9k6YdG4vHwASjg3v4Pn3tgiO4pQ8kthbhX9I
	 RHkKsnvkRU0FDbN+AYPsVj0HwAADrpNkzx0l2VIAkek9YCNbtFLAtAtVRPBODZ9zXfdAv
	 yOMsJIOGuV3Jtya8eMi0sKtY2n3QPpKfG/v5MfQYbC5w5593d6YrCBZm1UwS2o3OqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
	b=E1VPYNfBa6wlGqIvC+Rd6Qg9HPDdoXEhhShhjdU0IP9QH525RgXtBWk7QWtgY256gfW8
	 flmY+Xjyea3KhKpEU2E5L2VHBA3aMPY7zwphx3wxfKlKljq9i3PrWVMU3q24kBoNgu3Qs
	 0RZs7niKum2DJFmU/QnFemSIi/RFWrQNxrd2YdhSoMfDwt+TyW1A0rNu71r/m02b3+h1v
	 cUNRVqP4GCsLojot9Iaq2HKr3jrWlzYQ3o+1zkuKWNmb1o9CUsw5F85Ue4Ds5QGHBb/f7
	 uE96yp8v5vAN3BfzP3PaVm5Y5kI9ruFC7URCG45yjKbcTT4xb1zd5qM8Yb5oywiNE6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuhBzzSQ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C91606A691
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C91606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuhBzzSQ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4af52002471so5881715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555026; x=1796159826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
        b=DuhBzzSQIOmob5iiMXjAspZZK4dRaT2eyOggvVWtx6Q2OP9Sp9y1lBkgw3uul1qzE8
         72OVbG5PhPpYZvJFMgS+BwcIMli2L1YWDlhKq7lWJSxudTX+FsbdrAkU3tL/a7w8iYF7
         EfSNMKPJewpaHr+dqkGZ4QIUryrR37cEwbpbXVe7V2mo0HmNGPRdYJWUlCglGvpGW0AI
         w13htGx8cAnyPv7+ZYp1LEBujYn3k+wFzQEaR4NkKYsdcpc91DvcN4CBOpl10aWiN/cn
         pCE+bsI2P6xoVECfHM2Gx9sebBeOFe58Qi16fFvFYFZtKKlcbeZDzBJ2fNUa17IiM//k
         +YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555026; x=1796159826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
        b=QrN8t0mwVrrH6VzA2vlNet+FN+K+uJOAfUEnGDV/HI6KA6aEVDAOScCu8o/UpPZedf
         L4Nd/LMPZ8d6NHGj+4vt6Ect+Bg5N5YIzp7RoUXzwHeUoL/58ZewVyoJUueGCfgOeD4r
         tRbKDwqlBEvopJOnN4hinvJas9Yku3YCmDWGtkTXQzUDufC62OJdJUkJsLXpuUQsNjVV
         fXVZ9awsT9U0SrNJwPnLfhKnD2dgCxWXrD+TxZWpV5WgBvy3D/0czOCkd9QFBUT8Et+S
         haqkRtWwwOtq5dasovL+fw5q1X2Tir2WqOEEhOfMCKIX2mykbqHmowp1qlI0FJr47PXQ
         QPOA==
X-Forwarded-Encrypted: i=1; AL+hErF4hAdSy8vdQd1udjarRBMKMiAikMT7HQ7ZIGxoA06dJX00XtlmUTNlWYsKcvrqSfj9Gb+LMXATiWiaIoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Prjk5Y9gRQnJIO5DgQTU3IM37hA2XgFsBtZyTRuG2t4UNfXXp
	VzOwNevm0X32G6i0Zpu2+qzZa6yhQFcIKNzI7n1qFpRhcHU+kPrK/Luf
X-Gm-Gg: AZFdTZeBppwfAbBlCwTXJCLtorZYHKkNGBxj9fABegkJ5hqiLDUjXT9q+OXYa/iHLks
	7phnCbzcwRK5JQoWM9fedrb8ehUfUrPmUqu9TqH6s7tEGWUDns0lIeKrfpXbk+1VW8JaEJob42D
	uU+aUTZRbx0Yl3/Sv0Jzr871LVxifMIJcfWey7qjYdBg6jIFgjw9xB/qWmAWBnR8Djo/AFIwuYf
	618LIzF+oCliZQlErzZS3/KuLSWsb1uThkMWzZ+C4TXki3R6tEGWukZy3OMNbB/Pk6HMIhMZffJ
	Gcd82L2tueN4LEPLWoWOTY6G1JSlYfllI/oYP2pQyj+6jC1ct6njh+035cKmW0QQtL/H3q60ICM
	c7HiN2b23eArEIBDoOzrC1+rUstXd3HG5ugABb0R/SiDiOyXe+q7bEdubuwxqO48W0L/Ur572g5
	NnVm7HB6fFZz03H8z2Z1ydY9qaT70NqhomHZZrkEUABIIqbXbq1RlLtlrjVBz+lSBdcp15JoAji
	L+OyoAErdhusnHKGremUWQgXy/YxnrIfcNmbPI0AwKpi4e5vZnAtOJGnjXbzDWA2ixN6ATNlBXx
	hAmu+XE1+qaPj4Uhe/7vvm5D7j/sqPEj4ek8E4/9jqUQcuJdolze5IDbVWj3lbjU4bmT
X-Received: by 2002:a05:6000:2505:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-4ababda5370mr33797353f8f.2.1795555026024;
        Tue, 24 Nov 2026 13:17:06 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:05 -0800 (PST)
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
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v6 0/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:16:43 +0100
Message-ID: <20261124211645.5751-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once the propagation patch makes failures honest.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v6:
  - Squash the two propagation patches into one  and add
    Tianyi's tags.
v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate check failures to exit status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

