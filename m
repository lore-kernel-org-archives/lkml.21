Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048243;
	b=3YaecVhGRb0CFdBzGPdXYzf5mwtkgY65hz7dOud5P5D9tdPA7VdnFEvW9FigUKWJOfPu
	 kVoNeUiImX/5N4EEsdJ2+yZDSwll5xq+0h1u1tpbBuiLUI3v8gGPEEOPrmQRDGNqg+Zub
	 NPd/VDfHIExCmMzVLN5EPgfnPpYbxWod/Ay+ZTqXGYv9l4aMQPb5BjnKB9Zidk+LrgQAW
	 1Jq9ItJvPPWijlk23Us1uzMpiafV1hyYkZaJFnamCgPXhcjO4TzI9dZcUw2r3ejjikPCK
	 xKaDODIx5+YkpU3djx/Rsd1XgU7IilJJ0Hz/uh4UvX6nzz1qv+vL2cQvw/EX5MD1ttA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
	b=Nob4N3O++WY/CX+g5KExBaJn7EArUUsdy9BSDeXJTu9t5B6s1xrw4+2IT5V/J+SaC6qp
	 AarwtOogtNpx1li4sDxdM+gpmb7HNtB3gnre9NrUPBZJHWzmIkH22NKMSCwyIF1J/D1nc
	 sivlYO6rrg08E83VWVddMfJpAAx2GsfTpGZBNVYtFBMoLojjsaUB5DtKaOQrdnd4DSAlA
	 0k9wSeUdSr39acPe65WGctTj8vGGCT9XHuXbRg9ynTuRxu5Y95O3qhTpSqpFwKX2xQaMh
	 HEAa6dN/JF9QqH5tYvbF7QvZmKkyQUkUgOy6u921wnT32b3xWBfNRrc6j2YKJdElh+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA7ly8Qk;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE582606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE582606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DA7ly8Qk
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b75c0f5fe8so274399a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048241; x=1795653041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
        b=DA7ly8QklzTVI7vPByhXLORbOFKqcXC58tufHLEdaxrOBAgryP/bxMy8mJSB2CBH/8
         ado34FlA3guZ02gcBVrHlUq0WnZCAr9MTeyv9c//VuYh0Rjht8q2cqzQseKZ2UakxqDC
         py2sLEVftQnh7sMRtlOe+3Q33a+VTzYGzFL73vTTAt2BkjaS9KZeU2O2EHm8+I3a4SK2
         AuulkU7iy32PXxQbvH8aJfbM8R+Yy6Twtcd6eoXg8JYDXAqZE5K6CUPSbF8vkX5rZu5Y
         af9FdJpKLabOZkxQrTEds7KXKdFETs6vAz7Y/OoDQUHbEtMi7TF9djIVNa8O+k0K4x1a
         V2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048241; x=1795653041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiPMStJELJVEfo481tju4B7weEAXXX4fx2HGMzLvMQ8=;
        b=y6bdGMRV4jIP8LTRkZZpNL09EfRMcPTv976iW1v/pPlrSC4MESkejOvBkSAz03TGC9
         icBGmVTk7VQ8NPLEvwTooQzadnhlgLVB+MCmpekbYr4x4ENyerICj1QRzRd7zzpY9jrk
         27Zvn7s+HE/BeQjCj6IW5WEp1KUZbHrgqsXKDwcxbLFb+xNvOw8Azvv5L1TgvwQmXYi0
         8uTMUG63GlknvdmpGo6JBYrmOzK8VuzEpcGet5bcdc4LzVRd1yGpRF1xKG9rFL5RLCmg
         9Ulgpqy+sydWUZ4vW/LMx69dLAC1GzN4O+Jig2af98RJxmmEs+ktNaq+6zWejUouWhoj
         TkCw==
X-Forwarded-Encrypted: i=1; AL+hErFgHBM29mSRFAp3Nw8kjCORE2BSWMAYW4H6Zb7e6WdcXMBHg3HFUoIOwC61HSybtStwUKKm+1qFKlk2JQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SK7FVDEcuHCPsxygaI45D3RLhHCBaaipip+SMowd/7uJedOf7
	I/lyJgROrH8LVXg7EtxZnFBzTxBnlCT+DuPClspUH5yEfc/PdZLg7QME
X-Gm-Gg: AYBFou2FCDSusVG6y0+18Ad9beD+aKBc7Fb7JbVIEPIvhuScPtzrr/GC+BYb5jviFDi
	xl3iyLWjNZOUo2tK38LCtqPLow/zGimWnoVc74EHkBrKyEtuqFuHm39jta6tPIAM1Mu24WXJ/9C
	2Rbtbr06eWxQpFaWi/zFbElUMlenT/hitnZe3+XDvMktBN+Gq765TMiEUGHEOFUTPLOCoZ9nW+n
	MI5LuUtQPWxdXPUUtH1KRKAo3MjPoLIWUvGj9GyLF4L6YbcfEtUuUCsZ5qSsJoVUqzckkMz3GLp
	hiOXg/BFv1//aqNi9ORkga7MjvrFvKylj5+q+ouNjuy6Wnub4j74D7/S+8KANhPSR38nDuN0Vo+
	DhjaX1UGo0ptJt2FtTlWW8oeZxgThQukusTsKqxlnOa2j4ramTe/gy+MvJ2Sg1jko+VyGho/KPF
	ocT9MpU+5+fKtAyzcVY9UdCuYv9WtSj+JVXO3K6FVJLsr2IxcHO6kguvsbIIvKE4OnCSwnHUQAa
	pn926Yik2z5uVhL6EhcXV/qUw74gKJNpCZJaQpuT4aqwGh82Mo6E5zNWLTtOoBf2LHKd1DY8BAO
	iSzUIPuGD+faY0Q29uH46TX/E96zvgJXK30ZjdBJTxuKxN0hHXme
X-Received: by 2002:a05:6402:3137:b0:6b7:aca7:4cee with SMTP id 4fb4d7f45d1cf-6b887eac9d2mr3678935a12.3.1795048241161;
        Wed, 18 Nov 2026 16:30:41 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:40 -0800 (PST)
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
Subject: [PATCH] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Thu, 19 Nov 2026 01:30:02 +0100
Message-ID: <20261119003003.40482-4-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=`nproc`)
as an invalid tx count, but the kernel allows up to max_tx, for veth
that is num_possible_cpus(). On hosts where nproc < num_possible_cpus
(taskset/cpuset confinement, QEMU maxcpus slots, hotplug firmware),
the ethtool -L call succeeds and chk_channels() reports a false
failure. With failure propagation fixed, this fails the whole script.

Query the kernel-reported maximum with ethtool -l (the same parsing
idiom chk_channels() uses, first match) and attempt max+1, which is
invalid on every host.

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 2a37d21f97da5..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -464,7 +464,9 @@ fi
 ip netns exec $NS_DST ethtool -L veth$DST combined 2 2>/dev/null
 chk_channels "bad setting: combined channels" $DST $CUR_RX $CUR_TX
 
-ip netns exec $NS_DST ethtool -L veth$DST tx $((CPUS + 1)) 2>/dev/null
+MAX_TX=`ip netns exec $NS_DST ethtool -l veth$DST |\
+	grep TX: | head -n 1 | awk '{print $2}'`
+ip netns exec $NS_DST ethtool -L veth$DST tx $((MAX_TX + 1)) 2>/dev/null
 chk_channels "setting invalid channels nr" $DST $CUR_RX $CUR_TX
 
 if [ $CPUS -gt 1 ]; then
-- 
2.43.0

