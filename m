Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555053;
	b=bINHLpTLvdzicfrB70aOBBGECLHwoJkjWt2/iGjfOe1TrFL27gBxVeW09V/I3byHeDqV
	 CEz6Oh/jvW2hjyC10n7zjfdgbVnuTKPa3eKe3budHexi4WNZzrgvoF3/p6gT7Koirlzi7
	 tf71nOZg8iVriVYloC8R4igZ2g42WrJ/OggzQsKxsd45jZk9+82BMZXmPlC9k60u1CdU9
	 8qc5rAAuXzkkSMXlFWZn+MQfph92Wh2SJb2WtbkTLUDePuDIelU75zz37t9bTHTgr6Io6
	 MJLSBy5697gnbUFvmuOQChVbtJ+KQ9tfeVHD7xr6ixx55VDPyPtfJYjlYoP/8fFiw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
	b=UxfKn36hNXlB9bQEMktkfZzAYclPNZUrQgOMpMM+CFueVbXtEmQ63PkET3zsU4EaVMgc
	 6ExG6VrzGzGa3sIGzhtQggsgeqydqv2UWK4SwoUnFA8taons4D1EPx5XvgS/2jpNn2Hbl
	 4jLsb+Lwb8nTvBpAQWfZCkXw99c7GrCicAcu8BMDzdKRcPUAvNZURIJflrIifTTXcKzzm
	 h3i3niw30E+djpaiOtzgGPFukKSUo+yXAPKqJdozLrFL3UNDY/geh891vJCBjxAwapYBW
	 R6PgTo7oaNZeryh/ZCdLwZrCjPpCgBeMaBphYXDMaFe9bztJTqXgXwPVTBOB7CwcveQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQskcA8Z;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9060A2601
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE9060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQskcA8Z
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a440c9e13aso248039f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555040; x=1796159840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
        b=zQskcA8ZlHw7+1G3I3S8bg8c2UnVXlDZpZFu/cHgKNGJGagbRIqOyY8ZsJbyrXc3gZ
         s4tIZ/+yuoMMpwlJUeGZrac0nZPZTc2nZOorRhGee391KR2ctTyoGtIXZ7o3NSEJxRjc
         m4vcvdkH/VXXFLIiQpsIbfJd5cvuFI3aSATqy6dwE9CDrGlBMc7f2YT3ZLeuP8gnBA90
         7kVR8RjQwfYJQq+Qw3NCCdLS9Q9rOShcLzOfNWvczoRzXOeCMuPdUHYNIpcrXOZV3vf3
         ClZeVw94hZhtQX9wsvJnTTvEMf6F31dOKw5kDD3tOtGEHOWCZhTDg7ROxHfnuJLC5yFC
         CIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555040; x=1796159840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nCt5uIBBkppQcxpqoTId6AW8ghfLSBUA7Pu99I2wTq0=;
        b=YJ5HhQAQuSDmc4wlhVq2TaOeN+kBbZfHmqW1AGQI9IrNzRoDJRvpbcJ2stfq1/obP+
         +1EUohIhrsbDHgYRlAFfhFopTI9pmEsAM8Ne4Vby1f+p5JocZOkU83TxOvqdgG9X/yQo
         x5uN1db5PRnxDMBW6RdUUr2KHLx2V7lMyNiufR8Jl/0oS/VG1xcxMS+cm82h3lBKhe9S
         C1+5AsFR8XEeTxo3Aw/xZjehJZ6ykYT+7YqZLabGLTNT14U0fuMNOVMK7SEIOUw1FyWL
         I2TmOGALnkztIPBylpN+gW0HJPAGb0Mb/zGWUubCa+nbL6fsPVgUAkym4rSrQfCgr9pv
         Fdfg==
X-Forwarded-Encrypted: i=1; AL+hErHMDxzNYxsEMqtWvBOTguUacJ5/08mjtaSArZ/jj8tWIKkFW2Uijd8oPwPi+FGDNv3/0r1j0OIKjcTbBTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7xnfEcoU5eHQEkfHCu68n3pagF5ASkRSDynH727SDAeVRw3Vh
	oKnBUnkBxag/K/6r3IlXcBnS9TBTwjroaca1tqO8Arv98ST3rcXayEhH
X-Gm-Gg: AZFdTZfJc5IcDf1o3nROua6vTewdZHq7rKzF6nlzwHlPxBY4S3AQFPQbsiv33dw1dbv
	if6KFUQQYDxPVmYV+qydeVVwxkgNAjqqDUTcfpqYdBvnHVLsUxroMo92w5vg/tLBUTFc18CVHm2
	UXGuNFukc29iQL8m/TRtcIJmuIeQ5ZdgNq9VPnshMg9FMp27jfQicOubFKX9m2xt1SQoMj1tnJG
	Ft9Br1OuNxRpCB5I0k8XmHUZRZSgqHn1N+J86IFbJ9PrNzPtt5A511KCM2f2Lm8Zrp3dLNb0ais
	H8O2RDJH0DZD+cH9WyDW62LNxHZE/NdApWMC/OXEwK7F8/D2YnRaxcWLFSgzI819eQpfVCe3Jh7
	thNzjEX1BhyDaFn7kYGKw0A12Q0hmf5U3lSXFUymP9Dxo7dpvmda5iTHJHAH2NyB4bfFqzENbfO
	XQrVrz7V6xlt8F0nDoEjZoIcuK3ZKYVA7KuEyPKki1l6bghMOp2D2a2oLp20jN42FKvdslto1ni
	qBrCGK5z0zqSXpNVqj0f2l2zMovNa7pf9owhoF+Xyq1gZPxeDhK7TYR6SIRNoRDUOXl+qRIGnT/
	DUIeVw8DwyldssA91e6t1GkUx2SlZ5sLkPe7+Vy8+vNqg2e/l0qfq8pqgzT8Po9RfPpG
X-Received: by 2002:a05:6000:4812:b0:4a6:bc53:2472 with SMTP id ffacd0b85a97d-4abb3b41cf6mr29086128f8f.5.1795555040099;
        Tue, 24 Nov 2026 13:17:20 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:19 -0800 (PST)
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
Subject: [PATCH net-next v6] selftests: net: veth: derive invalid-tx test value from kernel max
Date: Tue, 24 Nov 2026 22:16:44 +0100
Message-ID: <20261124211645.5751-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211645.5751-1-emmaonana18@gmail.com>
References: <20261124211645.5751-1-emmaonana18@gmail.com>
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

The "setting invalid channels nr" check treats CPUS+1 (CPUS=nproc)
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

