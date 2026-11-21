Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285681;
	b=RiIEWRF3L09uCWZb2yvHllRyulGXVa0jhexFpnhNwBj8kSYn6hS6hTLSJnsWoYjmD8sd
	 Ssl2LJVYFH9zikZcMNBgN9kXLXSqcwrQMKhbcTqh+vSlpJItS+jQ5oZYSK/LJZUh0ewJn
	 WNt+zd20Xde7bzOipepTk576+fkw69arq2FLgWhHWdrQkXBJv/oIuoE2McshUplM22GUE
	 4w4gbkclva01xm553vxmwOaAXs80UqEExytHORv1lMEkzxEX7ZhoPMgZ6mOPi63dE71ws
	 mqUerqrsjEJdu/KIE2eiwKAskfHojv27aIb9nca0RHq8YO4Qyk5mVSuB03DO2wpqpDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
	b=PHTqLpYsBcZkLicvk+EKai0WRHfYfUl4wFe6XyLhSYkgqMSO2u8fi2ff7vLoalo51IOX
	 +ddN7nRh4hojFLaLJkRRYMT9cIFm18K90xQ9O3DbYv0qT0Zg8eGq2eh9YNALAyQZL+92a
	 aXvgx6Ben/mLQRjAlu0LDEFqjH0A6RA278kvMebkQH3OValRrTIBkkWc+vVC3Qj7St/0w
	 5Mq2XE9yn3kWvaBhG5TZTTbM048UgIet/PK75yWABdrbELRiQcWl5TBk/rVzq3ylBgXUc
	 uGAzIPiRXr6uExBH2rt8DNzkR4y3mMFUxW7nWp9IGv0IrlgwDd38d2ECY39Sq4NC9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyMluaa0;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F97606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F97606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyMluaa0
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so1585125e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285679; x=1795890479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
        b=nyMluaa0J1C8Evy34JB1U2I9D51Q8jV2XWGP33Q29wwR04CdaApUHFGVZ2CgDIlzru
         6JtGhIgueKLnH8bgq4caltjkpVzFJlDPCnKVJp3MR6DXGXe933oVBlSg2XJKdhtgD9y6
         8ZDnyTSpLzDB15hwFqy2tPgVOVY2zXmdMPG2Nv6qlJih+3q+3wcN4Ny6qm1QUQvl2C3F
         hg+NKn/4Zn4b0mhLm8VFpPrvJvhoGR/IL1PBlQUZZR83ssKIcynL9HPYhajsYO9E+qlZ
         s+EL0mbWGwNTx3uSimOvIAEK0oLNMwvjW+ejd7sUdYqOrb9LpWhoA1aBBJidKPmRS7Ak
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285679; x=1795890479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
        b=TF+i+ZPW4w7af+nwOtgE/jNg4zaCXD+Eg1tgtsdcxvWxDpaaqz66d7P+JM91M0R5N4
         YNxn8JcxU7Qq116qbZnVBW6fAFvU1u8U85pC1/oPQUokMAP903nObEBarX0eHAotbTjZ
         KT1imBwdurfvi4rlVSZjSnpWD67beGgaUgX1UUfhzXTrbT78Fk6cDNWE3n/1FtS4QTrh
         bZuwNo5H8olSMPTg6EmICKnFrm6P9vvUm2Zw2PMyFAMevs3l5cdQuCyyUVV1GAj0S0z9
         x+Rp6P3c90WXhAMc+tWQGlCigzeANliPTjadxIamxrCog7lbPbaajcw8xhCzLDRBPVz2
         r19A==
X-Forwarded-Encrypted: i=1; AL+hErGRxUtpf6HQsFkBfUczqzePxjJAJlFct7a3O1mi0bvXrzr+3aEeqgdVZsqb3vQN8HjH82NCRhAqxgjTiO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8DSBkoYnc+CBK07PI07vtESAUFic9TVrWVx6UhDH1z5hxCsd8
	x0dv/eUimqdMp8RhMC8/Zv0l14PpXTc0A1+PMl8BQnFb+kg9eCxYiiBM
X-Gm-Gg: AZFdTZdGjLkawkOqVHzjGpVh9xuPZ/3W9J5QbW/dyUc8Y14kqergVzQ2Dxu39263ELV
	SzxQ5e3zKcKPaNRtESqCxu2lrWfcJXrNtygUSqESCqe37aZ5gI84TOIKqTizRSPWsnBr85A/9C2
	+OI7LFZaPQFl9qcMYmN05YhXxqHuRud7CdNONHPKB0ThHiikLE9wxMy51zNN1JrYegw7m5Y2KMy
	OUF53q+yoAOlKe87NyAlNkAkx7I6FBmOTRBLBt9gly/RLOmiII9BaSEPFRmY+p2lvcpmo/cvqW5
	AvU0QQ4//t/8hM+WIt4MqLV82P58lQu8gDhnqv+HSPbj6ywr6U/D30Yq7QP3/u+EL9AT9ArWC1q
	E4/4cZNkCNND4wgbdbul59nWEWl5KBPkt1ZenUYlEy+DuNAcPKdz/nrZtfo2SeiWBXNNQu/I00V
	HBgRmhbzOUlhCC0+sFFLcKeQDUuZWeZ3f1j57C/1AvjGd/DYkjFAetzNf8tOOYxVXW1EFWasAxX
	diF2y/z3zp8t2RFR4uqNqUWbvNL9qDNTBhwG847oFsuq4VNWs2o7hIbkIgp0lA/2vbDlKhYua/M
	gg1UCtoSYzwxfhp9wmPo9ITFv59yaA7W3PQhYO/UQ4uHsgU2MVTwkEorlYsFF9g49aSZiA==
X-Received: by 2002:a5d:5f93:0:b0:48e:6675:3a77 with SMTP id ffacd0b85a97d-4abb400ac51mr13733609f8f.3.1795285679025;
        Sat, 21 Nov 2026 10:27:59 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:58 -0800 (PST)
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
Subject: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Sat, 21 Nov 2026 19:22:17 +0100
Message-ID: <20261121182217.4609-4-emmaonana18@gmail.com>
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

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 7a2bbed0263e7..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -474,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 tx 2 2>/dev/null
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 1 tx 2 2>/dev/null
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
-	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
-		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
+		section xdp 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -484,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
-	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	CUR_RX=2
 	CUR_TX=2
 fi
 
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
-	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

