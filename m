Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581074;
	b=HQhKbRZQqeJUO/baiL2vWYh6AU93mtjpZ42nycui1e6Q6r0WRJ+mWGu5ZSapmdNzT9yV
	 6Xl1MCL/A/ZKZec2r5S0vOYweWrnras2t9C1BB0euLZMsx+ciDiGTIvXueCxZOKoOZN0X
	 exPVHN5zpH6nqjyKAls4SQOqKyzTMtr9CUUYrgK1Lr6lT6jStVeTehybG0XUUm21uX71o
	 tEjcxf1bJY+oPGJuwJHfGsvpsXPWVuOo+9vGFpumZvRUQK7fDsvEQWONr2OhCRdZnO0s4
	 26TfqHujBOMaN8s27S53Rr10AWbwa0anT9myAM5582zjR+4XPPBVKJIYYPQjZlDqwuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
	b=SRvrFoeJSwn7cZnQ2kyQ3dIJWwy3wuR6lKp98HqZDbsPG38l2/K7KSGYdCHCYqdRcWSc
	 3NzkrDCYJbx4F3AFLU9AweRnu8YEL2zAFLPCD3Mrsyrt3tLOWcd9UD28A1CzPaoL4WZ6G
	 ok7gLXozOzHAfNqb57F8Va3TCifXp4LiiXO9Tnc8N3TGM0Cq19rv7VvDxOXw+GnW3nw7m
	 xcZTGXtyM7t1YPVNoPVeu95EbpAwiDo90fjnVn37A9tJLTaMONOz1mjLruSAJi4fiAWft
	 WQf4WhGvPe2mx6GNEeGJrFHLgXK2QD+WGvgVO6KuvftflD6i2neJOaPQEIigs4+Umnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060E606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1060E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363c8de563so57413491cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581073; x=1796185873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=t9xaBilIOSfrKNfdyYoYv0fqw8MH2K4V/ls2xdv/XMF2Y7q+0FeBKT08Y8d356eHZx
         ZZrO0XeB7oddmjUFHDeCZuq09o6W4o3F5l679+WsVsjdpvVjrBPpYqTziW7ImtZ350k8
         p1iBOcySHX2sS+BpiR9BlFHzYvx1Xf5ON00IpOEVWKdWm1jVnlRFvOGGzkWOZ7Fji893
         S8y5w1WZGalKSlup2KqBhICVzJi2gliF55C2HldJQMjAtm7KkLZy2sC67sVDx8rhKCws
         c1q3Kwib5FBhJNmqRxDoxocCrWBe2NOGQ4Hdek/jYKrlEBbApxyLcDVCiAAO6dN3AfZl
         nEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581073; x=1796185873;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=EqQhvsL1hbm9ROQaPpsT34mnwM1CIzdqQww/jRYNKq7NcYv4996XgiwjBXrzzG7d38
         VG91umJo5vKt9BsY2u0ACr9A99eCNiHDe6fU4YsGB7i+ILz0cvR43TDrJaJ8J9m11UD4
         Sr7+I7yHiOxVmghDGiKMxgorRW+OsuBkuOxuGuHT1ewnP1ytuiLDWZf154PUiaLB15MS
         3Q4+C1FmH4YE0ergdl1oU4+1JxIOMX+pH6tLT0AK+oWGRRMbAsSfzSao5FfvcdF2mxbH
         GZU272tNuFX/AttEv1fztFP/kzh/8LBX6/I+5pd9onPdI2st3rT0pPlg9gr+lsjy0FVB
         eTFA==
X-Forwarded-Encrypted: i=1; AL+hErFsfypPiTZPxdIf9gzQWPrHMheO6x6MOLDxLORwo2rnoeeAwP591ruigCW9BDQ1+I98Kgz+kzRaaigYYpg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RIzxJQqIrvK9HjO+X8cB1jnk68HPpbnlj/a5KEnPqgOuw7/5d
	/vdRko0CxrpEa3JA/3hAP9IAHg/cZADJaOXoMemJ2ES7zltR0BuIoOU=
X-Gm-Gg: AZFdTZepVC8wxOBJxdEpjqrh//xMq1E9AnnWtjPRQLJ0k7q+MHs09/Xdx5n1dMEITGC
	fp8i6PD5cHilZi+pyQkOmmZoK6YQqtswL84BZUfrB4C8Bma4VW+aUmVB5qs8CpZoeYob+RfAgL+
	BVvOVuPS4Qg9ZYTumEZhNYjtbR8oKIdi9G5Xnx4Jov5a/BEA2gv9QambLpTDFbfgMZZvZCS3Gzh
	Xjycdybq1Ro4A5cnLCo0aDnm1LhuZb4FSIHLYXPyIfrfnKGka2BMLWhO9EYuBTCeJz342qyKd38
	MjTj2/l1EzNaBWAcoMyqX/lxjZdWJoF8SnAqskQ+bqgzMf7T8tYFp9VaDlumo+8zcF0bPqXtLLI
	c7T8h1D8WWxNb2JDYk5poA/wkm+3SVCUzRxoXOVOu/YGKc6O1uNW/hHN//NjPdDsndZpuRnoDcz
	bkACONTbugv/qujLY5pErp0QIha9JxpzT5ejCjFFw2w+0lJjI1XvSv0LDoF0QBWh5TLMmJTznYw
	3jrdUbY3y/45cKwmd369Bryg2VqzS9pJGPTdEhUY2X4lfXTR541IiK30H3H0sJMd9VtuNE7ildS
	SiiZlVD/8S/NCT5TrR/5jNHDXuPwQWsdZq4NRmK0njG2r/8ACVQ+kBmXj9Onn4+GqzgQmJtElBV
	zUkb9Uwnqmmibq6Wud4HUaJT+KtcKMh/TY6Ypq0Xz3kN61EXzwIKH9rZ6HCCqck7fI37bAgJqt3
	NgqAPupiJUeZQ/g/0=
X-Received: by 2002:ac8:6545:0:b0:55c:f5a5:3900 with SMTP id d75a77b69052e-55d76aa8574mr311966681cf.62.1795581072923;
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm143087821cf.27.2026.11.24.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 04:31:11 -0000
Subject: [PATCH RESEND v2] Documentation: kunit: document --summary and
 --failed
 options
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179558107134.36587.13120861622026385297@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Resending: no changes since v2 (26 Oct), only Daniel's Reviewed-by added.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


