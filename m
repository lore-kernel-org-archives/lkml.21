Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009231;
	b=JWm9HoXoSOg9f9jSXu4pxkXNwOBmYJytiYMOzcOWagoWz4yOB+0bUvY68SDR0lcZBdvk
	 zh/SqjTeWOjLLNSYmmwt9iZ6/QtaPAMKcmlR9rB1QnPlxZ1m68/8SGVHYlrIZwhNPvdmh
	 vCCHYX3nMf+FAarzfDe4+BbxLF+ZOHFuGmCQ8eGhAEl2EPeSxWQMkR0bMpVdrUMmPTUzA
	 k55pEM4Zcyq3ZVUnv2rn9we4BUF5e6RtdYoqNh88HSUapYjhj25LjBGyorBxsXIqd8tH0
	 haeF6JUxUBB7amgjnQSFhqBcTHkdAuvp1s4ybfxwbpZRcrK68+BsMfaU1Qpc7aOIaEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009231;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ffGGHNKWCSxETLkGONbiTEwq2aMq5a8fFt/dO+LE6XA=;
	b=3CQhoJhTT4HfWBuV3d+MqgT1pIjFpkXeAhZpvB+y6u+8siOlt0DahyBJESWsDE5Oc9F2
	 +C76Epex8F9cdXk9bXZeV75OrUdzB2tkMk2MeByDqnZ00xBlOMZpPRWgDf0eEqH/adqvT
	 eKa1gkUhdbF5j9RKugAs+bMFFpx3vxU87IkAeMLGZRoIjw+KGMhBsHpV74J2stDxyOup9
	 i3NNQsJ8cN+ByT8FCcmVA3NEaw99UrbW7K4rbw/aR2NRbxhnfbnZgdP4JmRWW40fDFHii
	 TFGGq2pK0GyBWuYTSce7j75dzNbczLqKhWUEXCO2/XuhSirS17KZUGeb+6xu2tSml9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b="IPh/vKHJ";
	arc=none smtp.remote-ip=195.121.94.183
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FE606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0FE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=IPh/vKHJ
X-KPN-MessageId: 9aa99447-e355-11f1-92b2-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9aa99447-e355-11f1-92b2-005056992ed3;
	Wed, 18 Nov 2026 14:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=to:message-id:content-type:mime-version:subject:date:from;
	bh=ffGGHNKWCSxETLkGONbiTEwq2aMq5a8fFt/dO+LE6XA=;
	b=IPh/vKHJDPRXXlexcXIDYI8Qid0WiTIuqOb3egGNBUu41c5voP7EAb7bJYF6K4Byq2+W5WAUKNLJp
	 CJIXV51kQwkaCNxaI+3cbbdMPIRSGe7Q1YbjNs2/PUqoL9EeFC1f8wMf3wD6HFaDx/ebpS51w0q4/k
	 M60VUzswfpA23BfkilD+wyW2EUNdJNeHeVGGi1W4lx4V3eEECc9z0QOzsbVwNmMaURqI91/aQh/K7J
	 xYNP+XJYCJU3+r0gIkgvWQcGTQ6/Nx+G3/AMONrg9Rf/qEJj6FiSAoMi+iMPM2JpxQLxfpB6uiXJu3
	 ubtTwivtPKE/DlhweJCTbK1KxMW//bQ==
X-KPN-MID: 33|b7sY4Pp07GmT6N/UT6poXYD4KxTJk3GtwJE+RgemeIdGNG7rDB4bZbp50csDiom
 w1bEv9R8cyebfEi6ZGK9WVV2d5GRlw1Lnk0y7Lui3BAQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|yGa9M+T+n+0+j2+go80d4/Rg/ot9voV/6enMeQvwKVEl8YyKU6BZzJTrIP7NnXh
 WBJTHDWaIJRrFAH7t8EJpng==
Received: from [192.168.122.1] (unknown [178.226.154.85])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 9a9120bd-e355-11f1-a6ee-00505699772e;
	Wed, 18 Nov 2026 14:40:23 +0100 (CET)
From: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
Date: Wed, 18 Nov 2026 08:40:10 -0500
Subject: [PATCH 2/3] selftests: pass the timeout override to tests run in a
 netns
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-kselftest-run-timer-v1-2-53a838b2d62b@xs4all.nl>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
In-Reply-To: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
To: Shuah Khan <shuah@kernel.org>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Hangbin Liu <hangbin.liu@linux.dev>, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>
X-Mailer: b4 0.14.3

When run_kselftest.sh is invoked with -n, each test is run by in_netns()
in a new bash process, which sources runner.sh again and then calls
run_one(). Sourcing runner.sh resets its global settings, which is why
in_netns() explicitly passes on logfile. kselftest_override_timeout is
not passed on, so -o/--override-timeout is silently ignored for tests
that are run in a network namespace and they use the timeout from their
settings file or the default instead.

Pass kselftest_override_timeout to the netns shell as well.

Fixes: 9d0b4ad82d61 ("kselftest/runner.sh: add netns support")
Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
---
 tools/testing/selftests/kselftest/runner.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 9b1dad5441ea..06748af6fcf7 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -174,6 +174,7 @@ in_netns()
 		BASE_DIR=$BASE_DIR
 		source $BASE_DIR/kselftest/runner.sh
 		logfile=$logfile
+		kselftest_override_timeout=$kselftest_override_timeout
 		run_one $DIR $TEST
 	EOF
 }

-- 
2.56.1

