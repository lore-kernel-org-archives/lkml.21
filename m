Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991966;
	b=tekkMEeXF2eYFR8+Q26nQimvHcUiIAS6/tLqC/ZXiCDokHvCyq8Rq239wkyGwpfAwJuZ
	 oP+silbNIJ3dXBoBy2LIw7W2io5ZwfEWoga0itjrgtWrtghcFJRFIVXQPdemG1t4dY2Yz
	 RCmluSHMtihKY22iehQCy/fAL/uLa7bvebHqAqSvPeve7dJnfFArXttey7GPZVVPit8M5
	 aPoEBxZ5muBtPZoFJSEO9RRgE98SXfiy0YOGG9whDAtiQqrmbrKorSpabojbB3t5/tKrf
	 bbNDVDaBC21VkOvI2GX8re3PSGhv8hYY+rtcjaEDXszBpF71J9klbhcpBpMhMkEejOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=krPi16xH6tVaY+e08Z0j1ze4+4KgT2K6/rWPsZWSlTs=;
	b=edLwDh12ox9tuO4weuXseJovdAr2TVhTk6W6+2pjL2P2fjzv8B3eYxL59Ne20q1LQhjW
	 k1ptxeORpQ2eWuo+1NWkpxFVd5E/8xEbG4alu9WMQwhJxVqsff8mRgND50rP7uRlFEeW2
	 WR+3K/ijk8ztqzHAN9XKufvdBhRzHapejKbncU8Zj19AmJiB4VNVz4LRUL9h5d+neemUX
	 RObcjsCcZxwtgCAXCTGM+MAGiXyRG4O9fdT4AjBXLyK8wKFhWrN5HFsAj8mux3+WHykIg
	 srh6cBIDz7Idsj1pjZ4SpScEY7RAZdEFCwcQlhXlSbZJ0tv/KoVLyeE95BQi1tVBylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojxSF7kt;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3575B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3575B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojxSF7kt
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso77444766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991965; x=1795596765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krPi16xH6tVaY+e08Z0j1ze4+4KgT2K6/rWPsZWSlTs=;
        b=ojxSF7ktJz0O2YGuDQ3cs5y69A5HDP2xRJJBh0tCTHJl7koP5e+/z6heBh5Ouzyn7L
         mybD4zSZu9vokM6aFlkwDMsPH5cZPbBJ0r5CbVhzFxeEbocmNhnzpgKglfmREs5+cVqR
         heyoxL/kyaH/3gR4wWc+J4zCkwgsQph/+rAHvks6PHjZ4mdaItTyTHztlaNHGjyas6XG
         AfWvEoRjKcCaB7PPPaxdCOixMm5stSaxmTwGGjCkCEYX5YIDYfgiuGeHqxYxEbTRn3kZ
         7r7h8lXLv2Hzi7Z15Yy97ut8FQ7uCjyU8y9Gk778cfs6LJTJCb7/AU2Y/VH6MQlZ1pU4
         T/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991965; x=1795596765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krPi16xH6tVaY+e08Z0j1ze4+4KgT2K6/rWPsZWSlTs=;
        b=BrVfcTJKW7IIoBJnQID8ez0JxIQviLyUMdE8cZmZVEJeNC6hxc1xgDjGRqvkzjIhfR
         eK3h3h4vCfj4oNiEFsFq9WhG6y18iaF3//MBTpc0ys1qf3dnj2TqfVyqHjmMECxMW+WI
         q0LCjp/wuo2yDYbf89qwvPj3uv8LH3krTFmbDR2wWRUhC9GsBikNq/8tzQAYU/dEBU4X
         tZlCYCPkJe85Wrm10ED6+Gxr0fGFZXCzleGRjr8UebI/6cjOKC0Z+hVxzqu8xLed4xQS
         CwtzbiV35YylVm0j7OyA7PqjqlP4D91q6+F4HeQ7AE27IOmQAVPVsChvhO7rqSi1Qq2b
         zh6w==
X-Forwarded-Encrypted: i=1; AL+hErHLxXwfbdqU3Ms32cMwOf1MnWKyX6LglHam5Y6ZOHleNU5L8LBn2xkiu6ec3vcsFYyUD427mPCapKudC7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YUMCGBGmeYhA/FvuqQOBT/m0S37AFdh4+tCQrRMJe3Xzr07To
	OksiL78o9yI5e+okJagdUaCQGzhqV/YJxzqCmQDrJZOCGCyOl2eBQ78l
X-Gm-Gg: AYBFou1pscRpal+kNST4H2vJTOI7xynS7qBKTw3EZcErgY1Od/BjqtL+qd1sOx7IxoD
	MjL+PRLqNfmTZ3iswU1zzVRAlWaupEfgpie0+mSGyTko32xxPH21DG9WHXn9q8cJ7MhmqWCbVhq
	vjXlXJbSxK7Ap2a1K3Z/PI6h8izf81kcg/IraMabwhhS0/gSVPOpJx2ICGbaRoUpVCV/FOjuBBJ
	OoXIhNoI9OJv2f0fsYaC8qqtFyCQ5bCUU2xdzQ2S3sjNrQM84TPLae1X9n01HGpQ2ZO+Nz8TA76
	TT1k+TsRWtF0hVIfPi1txggjgcpPtxcXLN8TOUQZ2PLfvkDEf0uvPIi3ogwMFsVofNTRHF2B64T
	ZXiNLhilvsaLXqlpnx7ieLVLbc6rwEzsE5AM2trueHDW8xJKWXnb5FHBaBzpoIn2p+Q0PzPDN9+
	CRezGRnGo3dCqERpych+7Zq41WBgmAI5vre14Zp2M0emjr66ZbspooMQIasaPBl7RRSL6p5tjFu
	5MsBf9rBnvPIxtFgLEuRB3wrRPl/f1BKX8IE+vAUMBLxw07B4G9U6clxJogLxYtmE/Q4nJlUERT
	J1FEvqrrlTEywo8oVNSLkQUS95Az00Mw+b1z
X-Received: by 2002:a17:907:7b93:b0:c46:a5bb:5740 with SMTP id a640c23a62f3a-c510deb706emr164817466b.5.1794991964090;
        Wed, 18 Nov 2026 00:52:44 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:43 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 7/7] rcutorture: Run KASAN aux-stack checks from torture.sh
Date: Wed, 18 Nov 2026 16:51:47 +0800
Message-ID: <20261118085147.1668598-8-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118085147.1668598-1-kunwu.chan@gmail.com>
References: <20261118085147.1668598-1-kunwu.chan@gmail.com>
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

Invoke kasan-aux.sh when torture.sh has both RCU-torture and KASAN
testing enabled, reusing the existing --do-kasan switch, the
torture_one bookkeeping, and the --configs-rcutorture scenario
selection, so the added kernel builds scale with that selection.
--no-kasan disables both ordinary KASAN and aux-stack testing.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Suggested-by: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 Documentation/RCU/torture.rst                     | 14 ++++++++++++++
 tools/testing/selftests/rcutorture/bin/torture.sh |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/RCU/torture.rst b/Documentation/RCU/torture.rst
index 15a430f5111f4..8c8dcf6449bf0 100644
--- a/Documentation/RCU/torture.rst
+++ b/Documentation/RCU/torture.rst
@@ -244,6 +244,20 @@ As with the intentional warnings tested by ``srcu_lockdep.sh``, ordinary
 diagnostic; use the dedicated check to distinguish the expected report
 from failures.
 
+``torture.sh`` includes these dedicated runs when both RCU torture and
+KASAN testing are enabled, as they are by default, using the scenarios
+selected by ``--configs-rcutorture`` and 30-second run durations.
+``--no-kasan`` disables both ordinary KASAN and auxiliary-stack testing.
+For example::
+
+	tools/testing/selftests/rcutorture/bin/torture.sh \
+		--do-none --do-rcutorture --do-kasan \
+		--configs-rcutorture TREE03 --duration 2
+
+This runs ordinary KASAN torture with TREE03, followed by the dedicated
+auxiliary-stack verification of TREE03.  To run only the auxiliary
+checks, invoke ``kasan-aux.sh`` directly.
+
 Kernel boot arguments can also be supplied, for example, to control
 rcutorture's module parameters.  For example, to test a change to RCU's
 CPU stall-warning code, use "--bootargs 'rcutorture.stall_cpu=30'".
diff --git a/tools/testing/selftests/rcutorture/bin/torture.sh b/tools/testing/selftests/rcutorture/bin/torture.sh
index 90b5e113a0b03..e04ed2c27f533 100755
--- a/tools/testing/selftests/rcutorture/bin/torture.sh
+++ b/tools/testing/selftests/rcutorture/bin/torture.sh
@@ -515,6 +515,15 @@ if test "$do_rcutorture" = "yes"
 then
 	torture_bootargs="rcupdate.rcu_cpu_stall_suppress_at_boot=1 torture.disable_onoff_at_boot rcupdate.rcu_task_stall_timeout=30000"
 	torture_set "rcutorture" tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration "$duration_rcutorture" --configs "$configs_rcutorture" --trust-make
+
+	# Check intentional reports separately from the ordinary KASAN bug hunts.
+	# kasan-aux.sh supplies its own boot arguments and rejects --bootargs.
+	if test "$do_kasan" = "yes"
+	then
+		torture_bootargs=""
+		curflavor=rcu-aux-kasan
+		torture_one tools/testing/selftests/rcutorture/bin/kasan-aux.sh --configs "$configs_rcutorture"
+	fi
 fi
 
 # Test atomic SRCU across Tree SRCU (SRCU-N and SRCU-P) and Tiny SRCU
-- 
2.43.0

