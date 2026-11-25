Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644332;
	b=NpGjy9QsfRYZrIAts3cJkXeq4FUXltPXeXH5UaXLsm5IjneLloMpQ0X+lhEmbhWGUcez
	 NI9jZQgZMQ7Q33y4g2voVmV3dBm3XTPWtjgnmSvPGAgh9iRP8Ma1SAzwKnVcFCbQAtSHS
	 haM65H7BRG/t90Lg7OW4UN80M2H+eHI9g64RQaG8zM1h2VKQQ3UibEMzlLWjXizqYpf27
	 +7jVy3LXKqVZ1O5tPi5KapqgeXQ1S7cPFpyK3AeDEuLDtveW1mo4Ns9owlVJ+ACmxM9VE
	 sKHlcMAufEewxDx3yEAIZDukzATiIvy2ITbGUMopTD5XGMA9zu7orWA+xWrEtZFV8pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PFMx5gcHoGq+aybX24krgUmTqr/EIcl1w7rEetCl/eM=;
	b=j3HPbpkT0YahKBKjCnkSWXCNBiBFwEtpeaz9QGOHnzFGbvtUyhePpxcZCrYAjtVJM1eU
	 hX7jaX469rsyxWuWq+4j7VFDguFpswnGlfu9sMGHBAvSHRr8s9JJXfguwSSSsEiZIGO9d
	 9OkUz6GuOX2CRF+gvVfpsXCAOwMklHv+eYvp25QDHyX/moPI50Gvhi7q6Y/wBjHd3P0lR
	 yriQgQdnI4Ayg4Xv4NDmWCRbJzxutFc92/cOr0AIJVjHZrWTUcAsq6GMUI4eJthxKfnp4
	 UE3c9jZu9+3mfdt05eN12+92gmpGjTtkJWHpAjwbj45amE1JOBxGpw0PlL8B3Lv/QVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRsY6FcO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A12606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A12606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hRsY6FcO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so67956345e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795644330; x=1796249130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFMx5gcHoGq+aybX24krgUmTqr/EIcl1w7rEetCl/eM=;
        b=hRsY6FcO9VKK/UOP2vT1k2XjTWekQ5+uV5pYD/ykGM2TvFCyGMhb3aYmmesN/XrDM7
         /xa+R5z8TfXWB8q3iC3SJujbwY+KX79yguFoL2/rHEyUduY3s6a2Pv3F0n15bbHIg4V5
         WR2l8gEtzHyz0zdHGDTbTcthKXhlzTX2niHKXed5ySIIvuMR6lYDsV9apaFFC1GKGY0B
         yK6xEfP/kLAM90sSgP4FCwuj10gbhEo45nAoZhvn9+4Uwebuq3G/4Bvae1/F/7yEu/vh
         2FVnxNb/1g8JkQLKE1FsLRvC8Y8DAaiw0iilY6hXNScPUtyZmYfE/0UxFKB10RD4OMv4
         CLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644330; x=1796249130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFMx5gcHoGq+aybX24krgUmTqr/EIcl1w7rEetCl/eM=;
        b=fT9eSXsC2/WAzOJCClnI0D05xzXtVVZGZAxBG6R9C6aikx1Dx6cwesWsecMXJNebEQ
         X+JsVfR6GVzfxRPrQkWCFExwJyV74SuQCK0zyHxXvl1nWAvGfneKoUqosW58PnLiduBH
         fY6TZDUMKxPg1O1qVDYUzy25N8NyR40wwGoYVHVKvu8jmKJ/uO3f/5Xq+eDRuTkkyyjS
         ++8RlQXnw0lQ7Vr0nXl7jQy8WO1oKsjC1ge1u76cYQpojH6u15zR67tdB5EEArRIXFcF
         JBFoEOiFwxUwWFlDZHozA4j+qIXxtSENJe+NiLUFGPPmMvDrWq1s0stBwHUjxc6u2PFm
         dZ9g==
X-Forwarded-Encrypted: i=1; AL+hErEstojWIlWxMxoAGcqdH0AWkttiFWCtBNkcBcHF3kjjDq7VkAN6kv/TFBKrX5BRy4a9Yao20VeuhuDVj9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qzCesOt7pRdBANS0Q98Jk7jKwgtNsPfsabkJzkThtOnR6HXvf
	JozgrQAknQweUt+zfXzoetBFBdH3i1vEP2130HaWa32QJPu461yneeWJ
X-Gm-Gg: AZFdTZcRvfi/ek/fNoUOHG9Tjnl2AXQBeZy6dRcc+fWrwNVs6xvFQzvPbjvtWvyIsoN
	IVqWIcCRoCt4IaSrPukEu2M4aUEjowKOWCB71+MW7wFJHf3qu7TY4/8oBD6QBenIuY5MdCguMxp
	R/JR1LlC+Z+eS2RAv045EwobuXFy02tSUL10lHEyWFXIIw0Rf5Lvbo3TVJZgXEOSHNNXd+dqbch
	3a/8o+lfplfp/9F/mT0oQ/ArCx1xFpc2zbK9i2JQW84HunWkEKaL5aVlHT2N/vD2qxlOgM60uFd
	LmkPUQb8WXCJIOl4AEA7oF1M7k+fMilLccRmKpb+O1xkhqQEXLi0E1gRQAEhH3q3rGx7ePGsmDh
	A66UgV0yDIGKrw0yRBB3vRVMzkWwmMprbOa27woQ0CuLvX+QuFzTor6ExXiv7pBbacRiUbKx1RZ
	9SWshcNcAuB7Gdrisy1eXbsXEN4/ROYSYYGEeTwdxxJCY+FyHdU0R2sG6ryUgac6dS6VCD91c4m
	RzUFTRC1/q0mRiRMRxr5blxLYZpPxjen3JbgiEmb4KTBWzBG+Rb8Q/XUsWLHfHuMqwcKY3R3WCG
	RE5qiW+KNOHMYolr
X-Received: by 2002:a05:600c:e549:10b0:4bb:a60a:fc8 with SMTP id 5b1f17b1804b1-4bba60a11d2mr42321925e9.35.1795644330050;
        Wed, 25 Nov 2026 14:05:30 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1016582145e9.4.2026.11.25.14.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:05:29 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 25 Nov 2026 23:05:27 +0100
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCHv2 1/2] kprobes: Increase the kprobe hash table size
Message-ID: <awdbpwBAyzIdG9tL@krava>
References: <20261122200239.1481088-1-jolsa@kernel.org>
 <20261122200239.1481088-2-jolsa@kernel.org>
 <undine-1795477745290490698-99e2fcc5c9b45beb@undined.local>
 <awWdDfj1fknA8fuF@krava>
 <undine-1795616480318619368-1be7e961905611b5@undined.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <undine-1795616480318619368-1be7e961905611b5@undined.local>

On Wed, Nov 25, 2026 at 11:21:20PM +0900, Masami Hiramatsu (Google) wrote:

SNIP

> > > If this change is intended solely to improve performance for an extremely
> > > unlikely use case, I would, at the very least, make the size configurable
> > > via Kconfig.
> > > 
> > > Since this change affects all architectures, those working with small,
> > > embedded-system chips might be reluctant to "pay" 32 KB for a use case
> > > that is highly unlikely to ever occur.
> > 
> > I can add CONFIG_KPROBE_HASH_BITS with range 6-16. I'd keep 6 for
> > CONFIG_BASE_SMALL, so small systems don't pay anything, and use
> > 10 (8KB on 64-bit) as the default otherwise, which gets most of the
> > speedup from the table in the changelog
> 
> That is good. If you introduce the inline function support which is
> enabled by some kconfig, that kconfig can increase the hash bits. That
> should be more reasonable.

yes, good idea, something like below, I'll send that as part of the
inline tracing changes

thanks,
jirka


---
diff --git a/arch/Kconfig b/arch/Kconfig
index 1163736de1f9..350144df6863 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -141,6 +141,23 @@ config KPROBES
 	  for kernel debugging, non-intrusive instrumentation and testing.
 	  If in doubt, say "N".
 
+config KPROBE_HASH_BITS
+	int "Kprobe hash table size in bits" if EXPERT
+	depends on KPROBES
+	range 6 16
+	default 10 if DEBUG_INFO_BTF_INLINE
+	default 6
+	help
+	  Size of the kprobe hash table as a power of two. The default
+	  of 6 (64 buckets) is enough for a small number of probes.
+
+	  Attaching to inlined functions can register thousands of
+	  kprobes at once, so the default is raised to 10 (1024 buckets,
+	  8KB on 64-bit) when the inline site information is available
+	  (DEBUG_INFO_BTF_INLINE).
+
+	  If in doubt, keep the default.
+
 config JUMP_LABEL
 	bool "Optimize very unlikely/likely branches"
 	depends on HAVE_ARCH_JUMP_LABEL
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index f14f7ff45961..eba446e8ae37 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -50,7 +50,7 @@
 #include <asm/errno.h>
 #include <linux/uaccess.h>
 
-#define KPROBE_HASH_BITS 6
+#define KPROBE_HASH_BITS CONFIG_KPROBE_HASH_BITS
 #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
 
 #if !defined(CONFIG_OPTPROBES) || !defined(CONFIG_SYSCTL)
