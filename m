Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991576;
	b=zyaEb3CKg9EAnBbjO/q6u3UC2vIjUTMFjy7K4vmQE3KO/bQiR9znJ1Mdm5mJdLufqN0G
	 nT6N4z06fyxXp4u0eiJtxJWdxV1Ayen9My3UgwHBHuIdZOth/MVjP5FR1XoCTr3q9pPFB
	 QE/ijRFfWMq/xbVfAft4zHdrhaX07NN9QO6945O3txm2/dCgB5lLqIpqBrjbZskRiw9Mo
	 Cd3GoH8iH6bo5S0dEdKQ5tDu5wgyZSaMhnMuUqB9ii7gSdkDcMjE3ktJn5wwvMAKqMDov
	 VlP//KsccwsGKaIxaMqV06tasmZ5lKn70IxXGrKkpiri2OJH0wW5vXEAP03c8vsi3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
	b=sk92vtpgSx5DkMbL5g6NYjvm8Dfa4ekcdhEtJvIfGRpWNI6jntr2ErTdYmdG/0KraSI2
	 bt1wVdwsSkYwe1A6jv+yaOYyQgUnUAPZDWe4ilTLVVcqyF5bc1KJS8N41HmIVpCrP2q/c
	 zweiTTmV2zOm8HmBDZ+oy3Qv3HzryXPAHlSayRC+MZTcPT8AEo0Fl06IWOZQtl4HTPHQm
	 jr82dH2FrJ5TrccuQNaATau/QdJ860yuq13XpvX+jjTB5FR9SLeZPzM8MLSnm3EZ6lLGs
	 JZ6iO6l7oMHvfq5WqynleDewYl7gkAPoQ/X9cpIiW5UZu1gKQnVkBcec6zhcUkFIHhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVGaUt0;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF68606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVGaUt0
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1339089c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991576; x=1795596376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
        b=ZpVGaUt0qFX+fY8g64e6lfSZ6qDUG93vsf8J1YDKaJ//YYszq+CA7ztgrzDEG9cOt1
         WvUtFbMadc7JV+Vfz7dMqS3VNrppTwPCAfMUqjXCRMf+Xmzn/cA3k1VV6wDRtIFUoHHe
         5C8eDEEk4jKPUr5tDtaRFkBWw320hZjP2fePVtOA3YI1cmnu+KUOcpvS33oV+ermFd+W
         ZopHhKSa8ddS5XUHTfsLuTMs5bAhUqttDM1zqstvA9RmVI5BHbvs/O8JWrwxbOIcN7CD
         JiBGRmgNg7lblyYyO4QFX6Ozuq4O8JFPXGKHT6HM+hy0rII/NvC0J0NskiVWESPU9VgR
         BQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991576; x=1795596376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
        b=TbVgnAx8ngYxHrspVbtsegGLXm7qV30qDKMqd4/f7HzF1dwyhPS65rnUv9vwyeUKEe
         2ixYkuiwI5V8wQYEkZra+I2JTc/plv0c+a5JxT/potVzDkzrITaWqQiTP8+vyAee5u+0
         L7IdmRudZb66rZuVNU/By0X3JtoM98pVNKzApJNVMAwpF7wpq+d+EBiBoHwttPKSXB5L
         RXkFcv8tdP9LPGbEqg/VZSw7rkor0w2Ao5snNDq5Xmq2wFJKlnlPOEzPN84Pf6F7pOXh
         ct30aqW0WbIjRwfqqc0crNocUbxXrHCfG00mNVa2wgkwtV1nJKSLmHKwEr3fO72bm941
         8zkA==
X-Forwarded-Encrypted: i=1; AL+hErFJ542XQfIotZmgEIxyG5jadSB26IxLiHCak30uvcnLTzi0ZyV8B9vBh1swNeN6jztFZjTNbltIVqTouB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8spY728uc5xQ7cLfwkuM3qOQDnNfsJYS6spbKN9qVaEzryfg+3
	ZI3aAdR8UWmIbuKZsxz/JUApT/L18FRoUE/czNwsDopU50A+nc7cEYDr
X-Gm-Gg: AYBFou2sG5a/9mmN3FOIsKKfmFL9NmlS0yd5Jkv/ZQl2qDTursLt4iglrA3DNfin1vl
	Movp7Znxvu7GrYPJRERYuqk3+LVRVYgissbjyULpkgc9kmz87NnIwe0cTWhdzc7vCLF+FzUmCiz
	kDuU713Y3b0mI1HxPPDnn+EontO5Cf7Mtey1PsRnsv1uZd2+Qf0nfimPjc6sAWDIvl9o8H0MBu+
	nH+ROsvc1GM1D+QGI1yNi3AmxtFmBttHmp98IhcMMOuLkScx8pac/9vNRg0Gg7B+Zo9wUGBVRYs
	aY3MaUZar+i7AcHKCkckUHzwsBVmgJYUm0GbnXcL6rzMeUHsTcfsFU324xDvdUkJHySDSIzd5qg
	FOaeCNGwLp+Apyy1F1PFJN//UHbMxRtye9IMlzlqR5GxEwkbrFEPEinJEDFTLVWvFYQhWXSCbPF
	S1cQg8SxscyFPToeanReLDSc1x5hPUa2JqjzxkogT96qT7DnVc3WI7VI2bNYSV8hO3rbqUh7LbL
	a/0nXbPGG+Zmd9rJaSb0JPx0DIYnbYOQM0HITkw0VV51jBxslLcJtcMlXH6YE+SJwMeZnr/W/HR
	azqHzQGmtTmLLmmWrs8MqM41WJuuB15Mx/LiyLPFZEspIixjzMI4vsKG
X-Received: by 2002:a05:701b:4649:b0:144:fa57:c617 with SMTP id a92af1059eb24-1b543d32afemr1728596c88.34.1794991575630;
        Wed, 18 Nov 2026 00:46:15 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:15 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: test flushing IPv4 nexthop routes in compat mode
Date: Wed, 18 Nov 2026 16:45:10 +0800
Message-ID: <20261118084510.332821-3-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118084510.332821-1-zypulsecore@gmail.com>
References: <20261118084510.332821-1-zypulsecore@gmail.com>
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

Exercise ip route flush on a route with a nexthop group while the dump
includes both the group's ID and the expanded paths. Check that the
flush succeeds and that the route is gone.

Both checks fail before the IPv4 delete fix and pass after it in a
QEMU/KVM guest with unmodified iproute2. Codex assisted with adding
the case to the existing compatibility selftest and running it.

Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
 tools/testing/selftests/net/fib_nexthops.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index adbec51..d3c8cf8 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -2183,6 +2183,13 @@ ipv4_compat_mode()
 	stop_ip_monitor $ipmout 3
 	log_test $? 0 "IPv4 compat mode on - nexthop change"
 
+	run_cmd "$IP route add 192.0.2.1/32 nhid 122"
+	log_test $? 0 "IPv4 compat mode on - add route for flush"
+	run_cmd "$IP route flush to exact 192.0.2.1/32"
+	log_test $? 0 "IPv4 compat mode on - route flush"
+	check_route "192.0.2.1" ""
+	log_test $? 0 "IPv4 compat mode on - route removed by flush"
+
 	sysctl_nexthop_compat_mode_set 0 "IPv4"
 
 	# cleanup
