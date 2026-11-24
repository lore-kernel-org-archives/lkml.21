Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506711;
	b=0kPTfmhWv5/Xe++CxQlxyEyONMWhW+6R8hofQt8q1LYUfjlhdvbNK2Tf8uiezRLlAm6A
	 o6v9yfPaRB0LeGE3CYywl3Y6TyTSQNK/I4NUqn+8ExgDYh41gaJNtLeKpr7BlyeeOaPqw
	 E8/QzlMU9zYbsdtwzir1UB7rs7zYdAgvc+T4xPOFL++Cxa5R77rtW/LYG0HbNCpW5nrgJ
	 rSx9c6oGT3oB0Gac1vUtMQEyf7EMn1Qkc4oPoRVkm3BpoDzLfUpz3HFrbG/D5Kw+c2oq1
	 CHIvRGJx3qThriF54+YSg4+M16Ud0HdC6NE5BV4bBzZmtZ3mRqjIwN0DoT3Cd6mP9ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=igrsq5xWsPbd0pphtLnGo2EhnP6aWBAghEe3lo+KjZM=;
	b=bdUwAuu1IPXv81MkNLh0pPQIFFvX6KSjDFnd4OeGFW+q8F218UQ1GuBQ2r4Qn3CFyuiW
	 gZHSJVKBrBOdlBxzWlAArjdCahsTjhdAHsFy/WYEdHjSv+I3Qilg30Wde8v83vTp7yxHg
	 tKytA8IxOLkJXQ/qrKNtQpOjHj6um998ToTA8jtebXFDucuusUgzCvv/lFT056K3dQXRZ
	 UC2Qxk2i2y9kElFCcw2yj/P6yQtWDk4y9vQOU5PorA89Wc9YsNQnrInJgRXIBvvGIQMIy
	 1H24MD/v1dX1GOd3ASA/R+ffkS2yTiuZBvpuAQ9ox8XE3Cmou7espYXCS20FGHb63GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmokvp4g;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC04D606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC04D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hmokvp4g
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bb5afa736so474127eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506710; x=1796111510; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=igrsq5xWsPbd0pphtLnGo2EhnP6aWBAghEe3lo+KjZM=;
        b=hmokvp4g/seCN/ZTeRc0pKsFFQtsv5zJtV/w9ZxOFB9pfkpATJ5wbU0nsTIRWVpB+J
         TDhMDpDc6zCH/4SqOBim3lf7ruuIUL+eoKUlUyQcbRKLVFZUofni6mDkvQUdSE/ztMJX
         soYL6IeLAhUuI9K8tbrfKpZHAC1Eb0b82YS7ZfbvulH715wLFPGLZjWX5Br3K7L+LCPR
         PR068rT5HYS0bkSCsoYbyRrcIPfqGwqZWllK8PSBGbEoyj2IT4sh5Wll7nbhzBsiMFHS
         w9nEhdctyXGou2ODWauyzVwE991o7NqeHTihePfoHZl4fjDtkHFuGv7dsxbqzMIyE8Pd
         ijzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506710; x=1796111510;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=igrsq5xWsPbd0pphtLnGo2EhnP6aWBAghEe3lo+KjZM=;
        b=y+r6sqGYrVduW49L51iq+egYdkV7rj+diMUfX8dZJgMx31lHfyEXXM6VGA2zfEOXSG
         SO/sGSXuS3ZBcK1rBn1ODrqtE6HbNzaDUGnXMaNmIii/6fqID+PLaY8hiJXyNE7tH1Gd
         /XBxwjBKGQ9DXXjBjiZ+HhFPfsvXtY4d7PaeH4rBGJMx5sQ58rfixFEVrXfWIXzQLEBM
         cwsMT8wR9su8ssf4wvlP1e/1b/tWd2capsmBLte5u6jmgvDRoaZXQoqKhvfv3NimSaXS
         QZ+dE+afDAIe7RltFGc+Khx94QoafEU0I7/NGCx+Vp4vtv46089QAG5vhxsTzLnVyL+H
         vzeQ==
X-Forwarded-Encrypted: i=1; AL+hErG18+0RuDrHjpXk1+iAzPbar/fhjFbPwUxKuf3/iKFdeelOk+lpART7XE7SyfnoP0AM8ZrPIMyB1tx1ERs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/332R9w5fQk1GpKvvgc3mv4cXGd6m3blS+c2bwA87m/TZAkpII
	VioHYflCpAFCjiP7Br//LxyLvBWKIstauZ+V/EtUqqOdtuAnJq4MJbxE
X-Gm-Gg: AZFdTZdKOlNFbpuB5cxl3YrbYOf1EI044RHSwhaZteCwk67N999P7j/VEhauEM1vEcF
	0rorxWyr8/i5kiBlzE1t1G2dxAN1zuB1TljcJRA7ddg0MyD+H9VTYb2D9JYVF0nGiW9IILAm7dr
	BFBM4v0+IJi0uh7T0wJIiNiUPNdyNDg67pzGuUZgj5Xyyy4v0T6DDVU4dRTWiir5zztjdvWNOX2
	+OELaJ7jo/u12bWDAqBkSetg14aI0kRvSomkpGII409qg1tBtYmG4fEEwcqps7vJkp7IbZ/L8Vh
	N8TqEDcnMiApV3dE1JlW8e7rd5EVWT732q+Djkh/GVvcIgUpP55DGDybchpByPkictXgKZaWGtI
	TSTMNOQAaBr3eZGMkf58j7ObqIdkhzNj+El5gpzTaMV8ng0AM0Tv8Hjj7Mblb+tNhNJttXNYJDw
	6p4ynH8MxjhzW6GcULfjNhbrws7S8cXMujwCXMA6swF+HxwvPhZ4Asib3GZGBJlVpwg6cQx7IKM
	JnC27uQUmx3aSww1rt6DkHUtyFaf8pfVw+ojJ62JzZAFehpYM2BOeKVq9qgalhL3c6oBwl7SWP6
	fcOloLxI0vIMnd5t2dKfCuQoUkrkQokY3CmBKP8GO+bF43+cQRTHBkdqNlFSywzM3Gg=
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr18869883eec.1.1795506709267;
        Mon, 23 Nov 2026 23:51:49 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm53099098eec.5.2026.11.23.23.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:51:48 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Tue, 24 Nov 2026 15:51:27 +0800
Subject: [PATCH] mm/memcontrol: expose anon and file reclaim statistics in
 memory.stat
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
Message-Id: <20261124-memcg-reclain-stat-v1-1-c6cb14b0d917@gmail.com>
X-B4-Tracking: v=1; b=H4sIAP5BBWsC/yXMQQrCMBBG4auUWTvQhFDQq4iLdPqnjtgomShC6
 d1Ndfkt3lvJUBRGp26lgreaPnKDO3Qk15hnsE7N5Hs/OOcDL1hk5gK5R81sNVZ2CGHy/ZiOSai
 Fz4Kkn9/0fPnbXuMNUvcTbdsXrmg443YAAAA=
X-Change-ID: 20261124-memcg-reclain-stat-1e44d20bf9fc
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

The aggregate reclaim counters in memory.stat do not show how reclaim
is split between the anonymous and file LRUs of a cgroup.

Expose the existing per-memcg scan and steal counters by LRU type so
userspace can measure reclaim balance and efficiency when evaluating
reclaim policy. Report the same counters per node in memory.numa_stat.
Both files report the counters in base pages.

Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 20 ++++++++++++++++++--
 mm/memcontrol.c                         |  8 ++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 9e3c67b02ae2..eeeaf635754c 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1726,6 +1726,22 @@ The following nested keys are defined.
 	  pgsteal_proactive (npn)
 		Amount of reclaimed pages proactively
 
+	  pgscan_anon
+		Number of base pages scanned for reclaim from the anonymous
+		LRU. With the multi-gen LRU, counts pages isolated for reclaim.
+
+	  pgscan_file
+		Number of base pages scanned for reclaim from the file LRU.
+		With the multi-gen LRU, counts pages isolated for reclaim.
+
+	  pgsteal_anon
+		Number of base pages reclaimed from the anonymous LRU,
+		including pages demoted to another node.
+
+	  pgsteal_file
+		Number of base pages reclaimed from the file LRU,
+		including pages demoted to another node.
+
 	  pgfault (npn)
 		Total number of page faults incurred
 
@@ -1829,11 +1845,11 @@ The following nested keys are defined.
 	application performance by combining this information with the
 	application's CPU allocation.
 
-	All memory amounts are in bytes.
+	All memory amounts are in bytes. Reclaim counters are in base pages.
 
 	The output format of memory.numa_stat is::
 
-	  type N0=<bytes in node 0> N1=<bytes in node 1> ...
+	  type N0=<value for node 0> N1=<value for node 1> ...
 
 	The entries are ordered to be human readable, and new entries
 	can show up in the middle. Don't rely on items remaining in a
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1ebc9330aeae..ac12ff69a633 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1647,10 +1647,14 @@ static const struct memory_stat memory_stats[] = {
 	{ "pgsteal_direct",		PGSTEAL_DIRECT		},
 	{ "pgsteal_khugepaged",		PGSTEAL_KHUGEPAGED	},
 	{ "pgsteal_proactive",		PGSTEAL_PROACTIVE	},
+	{ "pgsteal_anon",		PGSTEAL_ANON		},
+	{ "pgsteal_file",		PGSTEAL_FILE		},
 	{ "pgscan_kswapd",		PGSCAN_KSWAPD		},
 	{ "pgscan_direct",		PGSCAN_DIRECT		},
 	{ "pgscan_khugepaged",		PGSCAN_KHUGEPAGED	},
 	{ "pgscan_proactive",		PGSCAN_PROACTIVE	},
+	{ "pgscan_anon",		PGSCAN_ANON		},
+	{ "pgscan_file",		PGSCAN_FILE		},
 	{ "pgrefill",			PGREFILL		},
 #ifdef CONFIG_NUMA_BALANCING
 	{ "pgpromote_success",		PGPROMOTE_SUCCESS	},
@@ -1699,10 +1703,14 @@ static int memcg_page_state_output_unit(int item)
 	case PGSTEAL_DIRECT:
 	case PGSTEAL_KHUGEPAGED:
 	case PGSTEAL_PROACTIVE:
+	case PGSTEAL_ANON:
+	case PGSTEAL_FILE:
 	case PGSCAN_KSWAPD:
 	case PGSCAN_DIRECT:
 	case PGSCAN_KHUGEPAGED:
 	case PGSCAN_PROACTIVE:
+	case PGSCAN_ANON:
+	case PGSCAN_FILE:
 	case PGREFILL:
 #ifdef CONFIG_NUMA_BALANCING
 	case PGPROMOTE_SUCCESS:

---
base-commit: b024a51b0184b1efb6f55b11aaf7b15a490a6307

--  
Best regards,
Xueyuan

