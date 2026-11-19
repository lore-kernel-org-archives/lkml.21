Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059634;
	b=PVgeVrm7gmRJT/a0GOt+Na+mxwfY7y4aZ4wR5vHDdBoiZohX5hPoqCFN2+wpHqZH6aUr
	 C2ipThPZAIfFClbYmt56ga+kwF3KFe+M4zfCXN6F3PeQgOPzrYOAqjVxw6I0TTA31oLX6
	 IrXCkbLVpG/Nms7UTO0aOQ9Qqua6fcQVhK82At0mvIhfPIfptevoF2KaiPSFHRJHVmPON
	 exvmhmtWdQKZ2fbpWrWsGibuHri4IRWuNrVVpfe2w6K0iSHY1qLMYuUEX9WT4Lt0KJ3lW
	 k5lkr1D84u1DY6KH8T+1VZ8U03XSbWPrJqbCbax834Z6UqbdnnTrg2e4QwpA7/oIlRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
	b=uAPlRI3y2/9dyeR7+ORELbTk5L3YbzSxHIOPNbyqVZq/EdSwvlJNn2URT/eYjgsL5Dod
	 d0hwA2ivvzMkOUyD1EDUhzeNt+RQF+1l3y/jpJm80SfTA2Hkw11NyaS2Ab2tuIeldht6/
	 qendNf3pdVTC4WYwMAiaCDSXO6kHF32tqxDJnTYZkKACPp5IduYceaLzt+TDOO+AOF665
	 zrsVUZb6/DkVacRUEmNS1rfB+VjYnqP58WXUVOCgPvfakjZjz1azwTlmD7sbJ5y89MvFC
	 MwbpCvnUJZXpxXVr+16TrD5YYRIKNKImG9ae9zzCAqCApUjn+fYd+fpMdxA4J8Wf7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYdT6RD9;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AE606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYdT6RD9
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2530058eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059633; x=1795664433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
        b=BYdT6RD91PSwMrZVw4XXQ+MToEPNChMkaqriBWZiXfWK0sB+tdqQdYGG0VQUPo2uDo
         DySl6cz7Yk0bNNRPE/FvwLNAnq/fg69ybtKaXEIu8peWCb6r1gpnsYdxTX6pub8GSizx
         TzcFtTiAx3OfNJ8EzB95+jOeRxHkDfoWm6KmqIfDoYDQ3veWZzAmhTCxRCwfwFLX528X
         ycrfiwhU6YjGyNtnn79ro3PAuj2i8fZcBCzD88yFB50ZrfwcJoCN6fj11j0wYxDCfwM4
         C1UIi7cta+MwNqb+Z6DMqR8PT7MaUKqDsiDuVc5rxHXVoqTubzwBwEmbNgQy/DO0DE9D
         4mpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059633; x=1795664433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMXueYzEMSkafhBw0cZtNBrJpZvkeyJZqfF9NmIV6eo=;
        b=gfJPDl9f0/PW38IUF5h6/Zrh3sCvMrvVt5wLrW67dj/tVD9HTxcpX0l+7glbjQ8YKD
         /lvsFkqhgT13tjArZD0yJxUFMAzHDsyZhQvvULvXZACFLVYs06bGLxq49Q2QSLlTApsu
         UWo/us552vxQ/fjwNm3mkCSI91n0OexXKIAOw7ZSKy2Vkxu9UJeBD08QZ6IO5vMN+o19
         Q/CQ28pub35pkOOi9c4lGBG1kRwG2oyX8mqY00WFIXrxT8L+CAxBC2NFALeL8APe52P1
         dIzeffxZ3IKPJAU01PGMh7egarjqNaSb4eUneL5ygTdVOvuLgVQ4V9dZlbELURJQE6q+
         YBnw==
X-Forwarded-Encrypted: i=1; AL+hErGwTwTY1x2/GRCmWgBFKubtZhEPGRN7xMrvr+Ky7gMKHu2rqgO4ebcrtzlxB53pBVA2FL5JYwroRONSdE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xagR97ckuYbBOfDCFRNFTX7psjHzDdz2lc+ljpBnPr1mLMMZ+
	iDobWdtLhN70AxL18XF6AgwRC+0JAYrCA/fl4sGiU1KM3k3rCSJMVvh9
X-Gm-Gg: AZFdTZfeN1c7oN61eM3tpMvIfPKKv7RTjwxkxLL+gub+I7pU+LtICRCoCwzTo8BqWR+
	6YBWwByFH+ApNsjO0Mo/K74QYT9GnqrJ989J1rrQkLCWBAYaakpZoJ/+zPLdmxABwDWBAMoJTke
	qs7fJQa3u8hBdqG8zzTnVGbHpn37eLRz5FyQcHbOH9oI6QaUCM7DPVeAmMKKCMdlX4hZpbEDtx9
	IGtE/loMioZi/4PG9FyrWSfy66mI0fNFEv/yUwfv54KDK7oV4npZbklskeofGi88Pmgor2kGula
	RugJYyDgLh8fdu6CtFYMxm6qkPg9vmZ6MCRf2fIlVY9ak7weuBv5bj6L7De2YABnwj24BQtULR0
	VA5EVgacJHuRhx/QqDiAFVRL5WgtFwCyu2VsjmEMqoxRsJOSq9DM3WTUgq4w1SG6J5U/BwRjfTb
	mazC1+NTsCaGyyKF/2k1i2BBzySDgTGEOioTDcxJphzaoVR8I9XBqsYmrtzKhVY8X5R50y89T9s
	vqEH3TAQ5z+7bcovhM1reFWc68LppLin2bEBWOFby1EhCw+gVmDfPUrL6hRXwFl3MozHdxsSm2U
	olTrpeIxClSu543iDRMlP7jeuBtp+vR7wg==
X-Received: by 2002:a05:7300:ff43:b0:369:5583:bf4c with SMTP id 5a478bee46e88-382820de610mr3957455eec.28.1795059633028;
        Wed, 18 Nov 2026 19:40:33 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:32 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 16/18] powerpc/pseries: Enable context analysis
Date: Thu, 19 Nov 2026 09:09:11 +0530
Message-Id: <57dd6459820b7c92907123a67659c8fb6a3e7fa0.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

pseries objects now build with Clang context analysis enabled.
Turn it on for the directory.

This checks that each lock taken in this code is dropped on every path.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 3ced289a675b..d5f9beec33cc 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+CONTEXT_ANALYSIS			:= y
+
 ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
-- 
2.39.5

