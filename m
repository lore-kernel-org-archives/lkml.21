Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876093;
	b=z87th/jlLD//zTcIUtAVKLF3aoCO9zWdwFE6LsHdXFYiHvXXevFDsPbHvIh/mF4nHJXy
	 nf5tnDlCd0VgMISDBkwyS+KHhKAO/fKyxC090iWSeAsDNM6hcq4mX3GEMHllUX4DksPPi
	 ds12ShtLV9RDxzJiDgqn5OuCUpW3SB3LWFSg/oNLkQyTFsrQ4FsUvkIXlevNuzzuliQj7
	 fTLuq7AhjBDFjfRLGt5bZpwzjEGElL1PQwmglDNXHmyPqnGIYIXRb3kAEKrdcgevDQ4lM
	 YquwK7KyiZMahTKjAgbiURPxLdzAEG9bIqAbVRwWRsu6KUl6c0lQw34IG8+RqBYQDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0o84T4cIEODIdxIW03HBz3DMcad7hAu5Aie4F8icjdo=;
	b=ipfRa9EcK8Ey4TT6ZIVJFvvt3jxCZswprk62fw9XXxPXX1jYWTu27yRmg8O+a8VsuMRs
	 StKixlYPjdFraY83I+RXI5cF+5lOuWFdU9zeSHpjy7WlVDi+blHVZG4tZiGm4bYNHTtXJ
	 vkQIDsmVLr0fM41XIxmqmuoTDw20uaXFkndw99D2JMb7huTfhpI/20EYYoc+ozLWqJBa5
	 Yt9CnczHFLKlyFl5guhYoa7OTBu/7Pnimgd0zf0922JdzQBF5tekZz8R/8MTKAeibHcGS
	 vkp3nGTJlYRLPjBHr686eGsNrO/rRK6LL9hQAFgCQieONtq930Hc6GJputVmkp1lCDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIJcUaxG;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25837606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25837606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIJcUaxG
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so3950195a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876091; x=1796480891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o84T4cIEODIdxIW03HBz3DMcad7hAu5Aie4F8icjdo=;
        b=dIJcUaxGqzsAB+oWbEo3fQgPqrdi8Is0Smd4eL85KHJkI5D0MsdthAH+f+cpKczc/Q
         R5o2eqKAuJT6Gix1wpUMHMQIOiOqTzJRL6ZDvXyaZRgJFbA9FwF/yXKJcZtEbH/caJqN
         HUGmZ4b9hkb7QRMTU3xy3gE9KCAn9Cxabr69rm5D57EI6Uvf2zxizREqAMRRGtWKRnCy
         MSR1ahCsN0JaZ47PUxWR31MIRu08mevXnlpiCeySpTW9VddxMb3+OuJxMyFYwJ/uvZRg
         D70iNerv8E7rWwwFPCpdqyPY78MY565ZF03lZ8Jt+A8mKkZP9+g6wGCghdQa4FCsaGYD
         4mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876091; x=1796480891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0o84T4cIEODIdxIW03HBz3DMcad7hAu5Aie4F8icjdo=;
        b=ti761cUnf9oRjgZCQYVYY5SRw4hTFYOvEOjtmJgirzAF4J8AIyrmQZK85D6gO1hjGL
         xtI9D/STvLugJEk8pYEpujVzUvoTEdqZIO9mN5xoaJVdXUNDGqg2gXbLOGUx633sb635
         IM5Od4quHlW4kzvG08IefFXuk3lOvHupoXDBqzkGMNtdQpUyTXcMslxeJs7XVN0RVyXr
         HQXHtEMh5N8ZYUgfcKjE7GW6nrx9WGu/W0TRH02nT4oTqEDHSK22LQPJ04fYE+vUkPlI
         YgFQ3IVjbMYr65kJ1sABShpXGHyjPiE0qsSMoGvmtWXmVuUOMJL6bMR+X+d3lew28z/v
         wRvg==
X-Forwarded-Encrypted: i=1; AL+hErEVuV98As6l2bKl2g5Y2ZNDmrdf/inbc0NcIxp7HrrqTVrqKQvHflPlAAEefN3pzkaKQdrO2k8V3f+Wmb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z82yh8jtV4JEiwzL+gCIfzhJIa5bs6ecIdjHDjzabadlbg5PkId
	XF4a/PEUhynNVlaHuXmHTROBF3tHxvIpnuFQZngdEB6QgoOPRnt2QCVo
X-Gm-Gg: AZFdTZeq+HG1/Lls0szbPLk+SvnCzIzB6xQRWnF6ixBDrvIWxiJT9w4KG+z3dVPTdbK
	3QYTzRfr+ZLb1bsTAcQcceYXp3pHVjN4fsUe95yrhM5Omszr+lkqXZcffW0KT9RDnnQsDKW7a/C
	PwnBJcRiVSdlR556TQgJReQxfKBXuaNjxzmzPp7kv3RJN5rzvHTgCNYn3RO5qYCh6jpv48iLdsC
	DbSkTBoB9eAi521jzxrhabs6pm67DnrSeJp82fmIjXkqRDKwxj4W7hPUa1dri3rJrGeJYppVu1S
	67G0dgBAyAfsQ/ZOxGv3Sox/5ejE8qTqqLe9U7ItRXuc78Vn1IqZIaA0Y07+GVdP+nLo74oagQt
	ZqY5tqe8vONaVvSnSganNTHUutARbDFEB4fHUT/c3E/SsGcNGSGwUjTJDeil4OZoWSC8ZEOfaPs
	KPsVWM5mDMKlHtGZn3fgoVTsbTbvcGPhrLdU4vHNboBNCGUle2Cm0YycAHDZfPVXaK0j7sAYL5M
	jpVhpAkBvdKch4AcTE+X8mt6p5qXL5waLzOTN7vd9x91MiFNiiQdRaEtm9E/yaOier4l2BMHZFO
	HHK6Pqysc907OGazPmZZ25GoqEa99943q/9UOO+xSEt1lDEZQHRaKxDeIlTjlxn/Q2S+TKZZ1Rw
	mmr0EpqFwFh6wroGa
X-Received: by 2002:a05:6402:1e96:b0:6ba:2f05:2508 with SMTP id 4fb4d7f45d1cf-6ba37ec0a65mr25175886a12.39.1795876091074;
        Sat, 28 Nov 2026 06:28:11 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35ca6sm12448436a12.4.2026.11.28.06.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:28:10 -0800 (PST)
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
Subject: [PATCH v3 6/7] rcutorture: Run KASAN aux-stack checks from torture.sh
Date: Sat, 28 Nov 2026 22:27:28 +0800
Message-ID: <20261128142729.3756679-7-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128142729.3756679-1-kunwu.chan@gmail.com>
References: <20261128142729.3756679-1-kunwu.chan@gmail.com>
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
index 0498fce14ccd6..98edd2f3e747a 100755
--- a/tools/testing/selftests/rcutorture/bin/torture.sh
+++ b/tools/testing/selftests/rcutorture/bin/torture.sh
@@ -514,6 +514,15 @@ then
 	torture_set "rcutorture" tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus \
 		--duration "$duration_rcutorture" --configs "$configs_rcutorture" \
 		${qemu_args:+--qemu-args "$qemu_args"} --trust-make
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

