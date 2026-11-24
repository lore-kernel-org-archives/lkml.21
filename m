Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556451;
	b=TLH85yz4B9ZKYpSuTv6LBGKz3Gg6jEhSoIfzg5d7hsf+kK7/87wtl17AT4QDAmNYb2Fj
	 t5+T0HldZWxjLs0As22yLn15/560G7rD2y2YS5etmgFmcKGC+9IhjIJNngcdDBCrVfkJe
	 sc1SUypRJm3bweQQgQB6BhIN/ubLaA3ty+rwFhRA9k1Wn8B9GDWeW5kGqsWlrTTjirheu
	 YpxisRMbEKHOEdf6fUe4oT9JtG5tFXvVlfb/Qi9VaZf/PE3EEEZJFoykAOCZH4SjCXIuy
	 bAOjrJ8gx77BGR+GVARQ3TNqYJYE1fcr+B1ZLrMNXsXi3xIvBBeh8UGLks2Jozb7fNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
	b=zP1tzMXwDPgTbfnliSQfBPKNLNROrMz64ciWUaqBdvVqARXkvAEDDCp6JElscb6R5iFR
	 QxCk+T8YrvJrGKE1EQpAgdC3jyOVSMr+cHxK+NLHxu2gJJs77R6pH0X/RAdbPPyf3XQsx
	 lpLTEeEZH0fklNXEsp9gu6piZx961dP16GxojGfwNY2Oawf7qgtSQbTgASpgDZd0dNV+v
	 ShFJT7chkt0kaMLa4DFYbZJtcanJmXAyRorB/hayE1lopUkl3IIZKQLfDmfCd0h/Bxgpd
	 11/hshYhERjxJzCrDrLVz3s8FolGq1GdzkBffRQLp7soxAGTFseZazaU3bwASu34JsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgNL8acB;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD03606A334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD03606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tgNL8acB
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a35df85cc8so381815f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556449; x=1796161249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
        b=tgNL8acBEFQiM09jqOQEKfm574cwa75oomLxVmAtzuC7msa6gwol4we64P9TRE1Dc7
         LXCA3IsW0m56tZnI0CQeb4Fm1L16FbwhcFbLuBopqGuvQRkrQNqL/neNI+9lyy3tn2PC
         f7coVRR4igE1DnyCqM1TZPV4Wo2SF40eBunmfhsZKzbfpatP7f6FHwEt/UPqFDXMdrbr
         yrGkO50XrHR5wyHxAKbkhWCwhQPLQeUTsIW9jKerUd+roFUgp5zxSlATOpCLFjL7eit7
         hNNj4fYtUfT7ndzyR8mLaNequNVrryrkOwM9FgKaxtjHwzgDreB2Yuq9hbI+Oou3lm1Y
         YSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556449; x=1796161249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2HebQcADRBDbRAS/PnKH205LJY85BhrCi94R+RBG68=;
        b=MMM9qIQwt+OL2cwX4iQ4A921ZVSMCNpiRY+O4USNjpYrnRMb3hD8nmxIwIi+qOnCoD
         jbq+emGNCKoMfUrOIiEBUMfDSqOMCYDYFv8QUbNGwwiHnbZG3YeEPprRJaHltVpy0N5Q
         QNaWyFUGcglROxQY2ZXaoRgDbTS6/ZBa5YKcg3MQpU+ddxARanAbRj+aPDl9bf9AxF8X
         tcCTuzzftc/A7Dj56ux945oovDIrWN3zDeA29mG9U18fC2nVdGrouxd/LiCTUDz2ajIq
         txmH03TNHDCAsFyvb0JWFZ6IJBR30GSQC5larvFFaNTmsWQPC4TrlmOBe2yW98Wwskjy
         mXjA==
X-Forwarded-Encrypted: i=1; AL+hErH0t0B3dSqVgNwWmCj8vW9TS/0y/A2oQQ0/aFCSocNi/Miv3S6dzo8cdGKyeQJwzPquXyKvMMzqvcw0NBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lyUYBr8pCHi30xb9sXgmKYkWypedQavT1oUG4y7azq5bXHCDk
	/jLIikPkQOOKzc401JvmrEV2k1rpjyilr5Y/yJ+o+e5+2PgE8+IsH5cb
X-Gm-Gg: AZFdTZcoGRiC/EGX8DK9VUkz8F6ZDy7nbOTmkWPZZSUBuYnlHnL9FghLPOHYg0QHvyc
	5z6cDMvAa047ibCSZoJq9zDXEX690HOkCJ7jmKpIArzDlvDsB0AG2joMpN9Vr8Wl8IrYgQ7StLc
	EOULwlLCITpBwfK1Rtrxj3CVdz/YAF9WL/UyW0wo5kKSVz/7g0PRLdD2H7ZCp0pEpt6U7/METXg
	eJcwp7IGc4calR3ymBFw3eOzL3kQbNwzPlbfhMI0g15UUwYs4Guv3RpNiYdlDg6oVFWvwlLA3PH
	rnj5duAnWcI4jdpxrs0ufnzoajq7EzLstDLPZusSOq/GM4sJqPLFGAJRU95t6yzA+wHYwlAkScZ
	NtnaQOCC3Lu8p2UUfgo/iXk4cFc2SJofvEp3EdVPvKMXex2gu8Ojl5WYbgf+F4pQrxFSAy7Ve16
	tIwLCg7pGhRm4K1bBdRdpoSSkL6q0uMtEUojYbzzn6L0rYJpaiHUfqZvYaC1zYX6nFMADF0szio
	11bwlNe60OvXV+fHaZsjIsRysDwTKrFEY7J2db0G9eKBq6vispsTKAhQMAl6Um52mECMZBV75ea
	UlS9/asDkVHQTXCxLN6BLsToHoIYrjfjjaZrCkoA9WcDx5srF8fBGtpazcA1i8nEaL+p
X-Received: by 2002:a05:6000:4817:b0:48e:eb:56a5 with SMTP id ffacd0b85a97d-4abb097b298mr35909736f8f.4.1795556449580;
        Tue, 24 Nov 2026 13:40:49 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:40:49 -0800 (PST)
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
Subject: [PATCH net-next v7 1/2] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Tue, 24 Nov 2026 22:40:24 +0100
Message-ID: <20261124214025.11603-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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

Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821d..22246278e6049 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -463,7 +463,9 @@ fi
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

