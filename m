Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438095;
	b=dA5G67rMlGbynC9/dm5QCYbgFxluRZJvJdgkWfo3yljU60/2tBvnzz+nUHPzLL6/bfuG
	 GdwbpFrlNzmQxizFk1uUZyHp9AlxXOiqPtByiCW8wHHhKiicNzbDgB3O/aqYDlrbV1wrF
	 pLN9COvqZtzP+rO0ATn2S8I9nv5209y8FowXqRL5jHWWNkwUAOWsj2hjp61fGkVg9W28l
	 ZlbClZGrWUotRwVLA7iUWlzVtq08HhlS7/NnaeOgEv0LbFHmy4EboDNVsc04Ekr8awx+u
	 R8nzWZVTvfZoE5fO7Z6+UMX1Pc+D2WAA7BRipi2owsuVXfPPQr5/PHnyz6cz6VkXTyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438095;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tmOGAwfjoirYyyKx16Cm9XsOnqU2x9q3NkaFjoA3TlU=;
	b=jWtoLKnwdZnc5lxwLfKP27bxUwkStGCoJ2OtPurLbtUX67AK0EmnbFdKTUU3VjBIKWP8
	 ndsY9s705wWPn4id5z8o2CstzS9HDBo8AHwDTbWPVVovNpzT61Wc7Dgs/xD4UqVubFRXl
	 20GNq5d/Vsg9ROGcR5p3+uCe95IBf1zKToxicEQMwewP+I9x+B60TvvYKixndGEAl6PNH
	 uB+GFR5hSo1J3XRpK9jLfHiHRcklnvr8vt+kvi/zlWer1d877iTtvy2VFcDuIPMvSF8cH
	 7aSVA+1Ekxg268mkuILvYSbdsHt/c1JowCVzwPwVG8+ICsOlQfFu6HjOdSw943I+15g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tdJOX7tT;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B306606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B306606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tdJOX7tT
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCZJdW3765880;
	Mon, 23 Nov 2026 12:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tmOGAwfjoirYyyKx1
	6Cm9XsOnqU2x9q3NkaFjoA3TlU=; b=tdJOX7tTJ73eJsTGioKe4LquU81PpG/6v
	70f/dEgjE3ecFHbRM8g5bEEbLuLP/EJ+pP/AgEInsX0mafS6HAyFHxP/FOq8cNSb
	zVixVSAOijJYvZu8k1thtbfisnpLT9JzGxTElCb70sGRu/d4rZB8Hhyk5g7hkiOs
	/hvozS1gx0P2RotNuRelUya/hzgP9YkGcl3zB1ipBYNdfN5ED21dp2PY8oLKYohw
	4WOfM9MvJHicQUSHr+T9r6oN0OrI9TuFCcz1hnWsocnyYVqorXYKbvM7CJLRnZ6N
	rHTG3A5aGgx+ds70AyoZ57zIiGofotWsWPbJAvgoEO56/lfav2B+Q==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fa3761-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 12:47:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCJMu43291225;
	Mon, 23 Nov 2026 12:47:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3pmjxtrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 12:47:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANCloXJ48234816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 12:47:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4B1220040;
	Mon, 23 Nov 2026 12:47:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6690D2004B;
	Mon, 23 Nov 2026 12:47:46 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.24.192])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 12:47:46 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH v3 2/4] powerpc/topology: Update flags and llc_mask based on llc_override
Date: Mon, 23 Nov 2026 18:17:28 +0530
Message-ID: <20261123124730.1466978-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123124730.1466978-1-sshegde@linux.ibm.com>
References: <20261123124730.1466978-1-sshegde@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX4Ky0Ayu5qq0I
 iDhX2XEAtH18BIcZ8MQ53DawVFldAgBocRZWiEQHhO9+PcvJR4h17HgWPhHO66pA1xb6XQVSS9D
 9rQZoz4I4qGViwzzO9aMLfeGOwcVJz8WoP/dX+DaakQ3GRM1mLnBVz+1IcfAJxLcX49K62XW97N
 eYSTx9J6L37BHjBmYEp4Uk3wGFVkCsGv9EvlLgWmSDLX6m8u7frMHCjoVD/T7G4/724uSlslB6F
 cmjfZc67MWryPzRt17UTwSqH5glUspszzx/CQHV+SL2XFxrOzuXcGp4AUnPWs/HaNiLVXAMk4Bq
 RgXqE05JwYjH+TiFhaaAOdZLWNzcU3SdXHTCzzWmj/+WTaui5PfOSzSzkEMznw3mr8Su/A9FS34
 CdFkE1OwfA3pOfBXNWRCvxIYUlhhSKUMR45U5foft+FqCc9b8PjFuHAU26rtlOJL6q32qUhSnMd
 3aR38ode/M108C9pDkg==
X-Proofpoint-ORIG-GUID: yLMP9atoGe64QlR5t2G-HFlpQwI6Juoq
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b0435fc cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=CZQ1z4IqUqhEuLKQufYA:9
X-Proofpoint-GUID: vNYIXrHiZuAaR951Sd8Zsbd4NJ6WdfTF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX/7aZFg5EN09S
 nKiIKY4UAWKCkrpHr5BtqQYcRl+30XL15nq9WSCmov5R5igRCP2lZUmF6RH3yDshD7LiP7JVcZS
 rXV9ZzcsPGH7YahnQtz5ro43l/rXstM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230050

Update the flags passed for building the scheduler topology based on
llc_override.

SD_SHARE_LLC is used to determine the highest domain where the LLC is.
Also when set at a particular domain, all the child domains are expected
to have it set as well.

Also Update the arch_llc_mask passed for building the cache aware
scheduling data structures such as llc_id etc.

Since llc_override is kernel parameter, this helps to keep the
arch_llc_mask stable after boot which in turn keeps llc_id consistent,
since llc_id are not updated even on rebuilding the sched domains.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h |  8 +---
 arch/powerpc/kernel/smp.c           | 58 +++++++++++++++++++++++------
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 02c3c9ab3ea9..9eb7dbacddf8 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -134,12 +134,8 @@ struct cpumask *cpu_coregroup_mask(int cpu);
 const struct cpumask *cpu_die_mask(int cpu);
 int cpu_die_id(int cpu);
 
-/*
- * Points to where the LLC is. On power9 this will point at CACHE
- * domain, On others it will point to SMT domain. In all cases
- * cpu_l2_cache_mask points to where LLC is
- */
-#define arch_llc_mask(cpu)     cpu_l2_cache_mask(cpu)
+const struct cpumask *arch_llc_mask(int cpu);
+#define arch_llc_mask arch_llc_mask
 
 #ifdef CONFIG_PPC64
 #include <asm/smp.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 446127ace589..7b9682e55c56 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1007,6 +1007,13 @@ static int powerpc_smt_flags(void)
  */
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(splpar_asym_pack);
 
+enum llc_override_values {
+	LLC_OVERRIDE_MC		= 1,
+	LLC_OVERRIDE_PKG	= 2,
+};
+
+static int llc_override __ro_after_init;
+
 /*
  * P9 has a slightly odd architecture where pairs of cores share an L2 cache.
  * This topology makes it *much* cheaper to migrate tasks between adjacent cores
@@ -1021,12 +1028,29 @@ static int powerpc_shared_cache_flags(void)
 	return SD_SHARE_LLC;
 }
 
-static int powerpc_shared_proc_flags(void)
+static int powerpc_mc_flags(void)
 {
+	int flags = 0;
 	if (static_branch_unlikely(&splpar_asym_pack))
-		return SD_ASYM_PACKING;
+		flags |= SD_ASYM_PACKING;
 
-	return 0;
+	if (llc_override >= LLC_OVERRIDE_MC)
+		flags |= SD_SHARE_LLC;
+
+	return flags;
+}
+
+static int powerpc_pkg_flags(void)
+{
+	int flags = 0;
+
+	if (static_branch_unlikely(&splpar_asym_pack))
+		flags |= SD_ASYM_PACKING;
+
+	if (llc_override >= LLC_OVERRIDE_PKG)
+		flags |= SD_SHARE_LLC;
+
+	return flags;
 }
 
 /*
@@ -1059,12 +1083,24 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
-enum llc_override_values {
-	LLC_OVERRIDE_MC		= 1,
-	LLC_OVERRIDE_PKG	= 2,
-};
-
-static int llc_override __ro_after_init;
+/*
+ * Points to where the LLC is. On power9 this will point at CACHE
+ * domain, On others it will point to SMT domain. In all cases
+ * cpu_l2_cache_mask points to where LLC is.
+ *
+ * If there is llc_override set, return the appropriate mask
+ */
+const struct cpumask *arch_llc_mask(int cpu)
+{
+	switch (READ_ONCE(llc_override)) {
+	case LLC_OVERRIDE_MC:
+		return cpu_coregroup_mask(cpu);
+	case LLC_OVERRIDE_PKG:
+		return cpu_node_mask(cpu);
+	default:
+		return cpu_l2_cache_mask(cpu);
+	}
+}
 
 static int __init set_llc_override(char *str)
 {
@@ -1759,10 +1795,10 @@ static void __init build_sched_topology(void)
 
 	if (has_coregroup_support()) {
 		powerpc_topology[i++] =
-			SDTL_INIT(tl_mc_mask, powerpc_shared_proc_flags, MC);
+			SDTL_INIT(tl_mc_mask, powerpc_mc_flags, MC);
 	}
 
-	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_shared_proc_flags, PKG);
+	powerpc_topology[i++] = SDTL_INIT(tl_pkg_mask, powerpc_pkg_flags, PKG);
 
 	/* There must be one trailing NULL entry left.  */
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
-- 
2.52.0

