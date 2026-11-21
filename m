Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285611;
	b=23uM2hmnxWf21Oun51rS2+m1NASuipzeodt9aNkzLM04CiivqA8FesFVFacIOUG64vqm
	 A5EQ7HdK/FZERWQqu6YuWcLjZaIzFNVGd1YhSA1s/9h4FW7Ox1zSpJRww9QY9UHrU0eRA
	 n40DFR0a1DSuaWCTpgu8fGPfkal0k7I6zYAfZu5CylAccPzvxij0y0JrN9osXx9qgD1mI
	 IyE8m/Q92MM3m884F46mPkQS3PnDVEz2CqYChXyyAmweyXc1tHUsUpVqadi//2tFCxt6H
	 gXAu5KglToy3NIhi78pjUozYii45X61fZqhGRFBW4S/53RXvuJ7clgvrN1mMy8Azo6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
	b=jw6yVJkGJegMBKIaEnYJYFtMCCgAyXYlxVWHO8E1iqC1nKqQdfoqrorQ9mVjjQkQf4MK
	 5mdaoDl5X067ltYyElGnelfXAwcN8wNoGk6zTzsaUC+ZZaT7cE/lliAgQR1g3+COSlzFR
	 IyArW/GnQ3ix1KTwN60qKE+pYRqMigAFKFQ4gdIvCoPYeoBhStYjCMr2gn1e8vsDaQRzO
	 DKkMnRV9u7qIBlb6j1YIyt/YQU7cyxVwzyksDAJRSgFNoMFr/FD8Mm3FAZ2WlCOYYU5SL
	 qml0QEJpDhNmiBwelDcOClDE2zDLYmTQtyDN03PxGQw2OTi4pyJziNaYAsYvzv46dsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKvVJIJ3;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB0C606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB0C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fKvVJIJ3
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so1584545e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285609; x=1795890409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
        b=fKvVJIJ3xbhMBJPHM5lDunHvwr/SsXQmTjyx6iydI08yXI/VFQAys1nPxfXh2/vKId
         /j+pNTygWGLlZbjeaO8Yq02y6RA1fZ02FPFjhA3564s4/koTy8ZvpVZo6uUqgoytzELk
         2ZC3WjtzjDSklWaf0cSW0ELGxJ0Kcf60hxCEJn1ZuxzlGjGZYwhTf5i/4c27bl6e7JLs
         S0AUM7oLy+k0khZvIAu3zCW9H2YhrvOATfEyLUddeVsUB2kBLVROU1D0epJCMUoAsBgc
         2dXeSUGNqUJ7Nc2tXt1cBJdPbHgiTAlX7jMa+ANtAOQk09A0bHT6c1S2HkKmMzjhcE/N
         x/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285609; x=1795890409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdXXKv//+YLQIm6mnt0NYSwAhGN57SfFKoOM0+stirY=;
        b=zUtphv2RMsBEPrxaHTIXGZEeB/IoBYL5u9t33u+AQMTT7DeA/8qyCtLtY9IO8gM1FI
         Ka/vEpcjsbk528mtFD1SiLvcObjnd0vdaygmxWHIRs9l02y3YyafUZahTLDXQq8f7po5
         UEtqXiI886SaWVyLhXCQOydZPJGVr7HFmLOwz1sTR2JbsC6ExQSqDca+cjn0203JD2bB
         XljpTbfDn2hxJS31+GDz4hZRrXuxFJXHt4hHetZfvTchlZrcw9edfB2GZw6eSyT+1RtI
         3eh6ZHqn+kbP6xrxHwpTlOpbp0FHE7sNc3UiNNpKKyjwXvf4+3ScYn/XKiPcwas+pO9f
         +U0Q==
X-Forwarded-Encrypted: i=1; AL+hErE31A+CAiCmB+9o9KVNceBipCCkwh8PKugGYAG5FZpLmKj9D9/r9GHV2W3+29jnboDBUJORYUZ2sBcNGW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z894Lc4nJZZKTNDyTaz72OhaxuRGTNmcadS8AcN8kRiEnxLqUhW
	A2eGmwkzZCnchjprklc3SWZhlFwcnC1LminZG94Jn8lt2jfwjbhBnky+
X-Gm-Gg: AZFdTZcciq5OBI5NyFm03dIViEdxNw3UFL4P2H1SGE5a8LgKRZNPule2XRmpV5QDSpZ
	rUYw7MNFJOeJT9tu08zcGp/QBHCfdBivEio6QGs9bsUvHnpH2KhdwvN0rG8YAWkA9/hpVkHGPpg
	SXKrbIBOyJJsd42UKkWTV0ZgaVs7ZF4vBl/MtJbl06NdFaW98NZCO8qzTkyECLPGVWNDpf2LW7F
	aezTCAGsnzEENX9kMJjsn3QR9Gozmda7AXBHCubeT+00U0vkrQkMQMN0xVAeBGnv1C4Ly3akQSv
	mnRpKtxvYSNczL+G/h5c62QxXqx1Ckb/JPnM1N9/bcUoXcAJWivwNMdEZ1JiFtD3PyD7/3A0Dtw
	Z/mVM4+UMI0vpAK9vgYphAZYIp+nb7ZYGgDUefyRkrE839LMtdPYrfcyE903i28I0RWLFEG6wxP
	bzu0tb3W5VaTFbhKscK6hoBWcxmdeE++0rwb9zOMVMS9gJiFsfGoAEGioKqmrdXK7jhzMKMfRqY
	hEjDcdMl2dPRhzOdl26u3scWKhUzZqn+YpUTLzXVggOmIhnR0FX3XreoETngC6j2GX8nHwYz952
	e5TGfgc+vj8+OTn+KMNnWKLayAcJvjWAt2Hq0Ah7vHO+VRb47BazI3joVujbaI7vO+5Flw==
X-Received: by 2002:a05:600c:8210:b0:4bb:7ad8:99f2 with SMTP id 5b1f17b1804b1-4bb88785da4mr143498125e9.0.1795285609454;
        Sat, 21 Nov 2026 10:26:49 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:26:48 -0800 (PST)
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
Subject: [PATCH net-next v5 1/3] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Sat, 21 Nov 2026 19:22:15 +0100
Message-ID: <20261121182217.4609-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

