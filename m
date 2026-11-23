Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436153;
	b=wb54nly5ulKzhEOlRGsasc4qlD32s+xSyOwMsKMWSwJOz4hqeuGo0kIp2P7O83j8MNbw
	 1T7m3cWwQ3v8+/VHdiqQ6ZI2XWqgRMTZBEicmMWLeVvuTOBQJnKsaTckZWunQkv9VmtWa
	 mHV2dNmupbdyyhgYME0gVQhW1+scPkzwh+sOC9fXtI81gSBVZenJWUyXmYlw26GckooRY
	 8DNgY5rRmLhufWg7t4Ws/3QLZsJaak0Xo7cH1sUprwjuLpFE8sTawZhdRJSfbNXrbaaLm
	 QsIKLpwr4y+m1PwmR5f9ZtP1+AcbpcyVtVoLSXchkNIyeS36pAGby/w8Kr//ohT05oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8jk8/lTikrKaWneRtmXjwH328v4u5+a7u543uK0spzc=;
	b=E+ZdmVk79BuFgzGQXf7hdjGWUxW352vBLTmrk5yvJl46hUP4owItUX0lCj0I1miVdNP3
	 4W0w0htlFaI4UvGPaDszFHwcBXGklLB9BcfqOTqH5jp37A0fOmkSTa8KRdLRk1h/qMMdo
	 yMRLzP4D39GAHeeEXe1P4jjmywMR8pxKaByFLJoOt3hfjPYILfDrB1pyETgF26JcXeY1s
	 VVJybQ1WrJsqT1v4h2uCQxtWjCL54kpib7W5QdmBCx2VEa75Tel76+WoN0CIYF7xNjuq8
	 MFRBljogR0bRW2ViZ0xMkm4iPYB6k94ITavAYJ2b5Q0uLNT7ntWeKjtOWJ775SKlJvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvJjDiST;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9BC606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D9BC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvJjDiST
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so24351835e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436151; x=1796040951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jk8/lTikrKaWneRtmXjwH328v4u5+a7u543uK0spzc=;
        b=fvJjDiSTwTAsXhI753fJVkY1MBn1pUvJ0gJuurvjw0KQgCZ9IckfQTuAmmCSGiMNX/
         UPEuyDjvoRrXjd6mqHrINIcD07l32C20iZKkT8ug8ERpgNx0VRAXL9gs0iYoR01bXNVi
         bpkq3azTee/na4BrvTNyeLio0RqUd9VHjj8rGLkkSEuQjUb6UXOO8KIxMAGHHCk147II
         IaxX5cHmXu6bZp9OWaW73pmHThnDCHfbay5+352W0lV/eE/K+NwYlMb9qvf2Q9nS9HA8
         E+pcLOS2063hbQwW0bGoOOy8GZ8Y2NL2M6/QksSunGfTrEod7Eqnsc7+zp59BUwKoCnC
         qc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436151; x=1796040951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jk8/lTikrKaWneRtmXjwH328v4u5+a7u543uK0spzc=;
        b=rmFZdutYCT8Rk0ZX+Wfj5xBopepykgKw46zK9enIFYfL+JV7zTLZDQN03AMHrVIf2k
         GW53jDn5OmVRKTXVj9ikKoUv5MyJFkp0l2VBfOBsi8GuR/a47Z5NzxJrt30Eun0o2e4m
         FoEwgrVGiQV5E7dKyXc/vNXtTB8T4XaD2iDxk6KKRYS37abdgyelhU+hGJzMZhG6HJex
         ZQs+B32mUKDGIztvmKP1uxontcW/kwEy2KldNL4PvgdwI7Sz+wL46IaAw5SpEpAsG2t6
         0gcjExWs/cBdX+sVggWtTdNeL6Zr/ybN3eL8fQ55G/fsmFVsOO95Ig7im0flfp4za3kS
         Uz4Q==
X-Forwarded-Encrypted: i=1; AL+hErHVgvSgcPZkxaVttj5lpVRw8+fgnlmk4hhFvI24lLEC0X7Ztgrn+lSvuEfEYXpfDxjBI8AOiDwJHF2NnfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SVkdbqcKcBQoeoz6kunSeLmpbrMEYf+RCJPQKXZ+bsT3H5Jsk
	VgUgGfoYD7d9P9cCd4dbKc6gPEHPYRNQMweDIeBZBGeOI/fNMiPPZ6hb
X-Gm-Gg: AZFdTZfAXNbuWg3W7jvPW6bXlYc08pW3tpBJ3VxmnEF3bcp5JxjeGm1pEmuoreGCfdV
	7sk5LINAx+5Sz3ptIZXlbc65UPd24Ns+vo6g7T1gPEg9HideUXoGFSiUSma1JWKoBNrE9IHVViv
	0DTJQxEWz300tHLyuwDJCvNsWSRswRj1E6c+ZFKtj2k0NIpsW0O/TaRZjmkR3BFFi/oPKAQmR/l
	T7ReZZTjmAPQq3JbbW9ZFjaSqZoD19rRWkFVrHOv7DwmY1gGzRhAe1g0DWulI+G8yvD0KBEBWBj
	yaqkCbYHNLJQJOSEdXIPSqlxuAZZrriE6dvX6k+Hoy+zGdZAMHQPv8e/wIxzKzJgFz6dk6/GthA
	NnL/QHw8AbWsgxJCTzHoucED9l02lH6r3YyldohI7WuHRT5WB6Fq0i6iOeChvHPIaAzg1RylABq
	OKy26dsKf4G+Er4piypuVrpkIh/wE6lDDdS3fa4hpXTaBI3NludWNSM2sA0Hl6dcnVZvEMqw3+L
	9vTLl9mupj91iAdTkoUJB2+B0oCyUueAuZ1XJ6ik9E81tyBMhndLsAtF73v0/DZy5K78oB539uk
	Ituo4/HLL2roew03XJ0LX5OOnFEa4PM8xR5WaHukAxB+caAOGlKsNyc3z3+Dosk=
X-Received: by 2002:a05:600c:6218:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4bb887c341dmr250840055e9.1.1795436151318;
        Mon, 23 Nov 2026 04:15:51 -0800 (PST)
Received: from localhost.localdomain ([102.187.134.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm408975775e9.11.2026.11.23.04.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:15:50 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Mon, 23 Nov 2026 14:15:13 +0200
Message-Id: <20261123121513.2112743-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261122064155.2094434-1-mhm.dawod@gmail.com>
References: <20261122064155.2094434-1-mhm.dawod@gmail.com>
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

Thank you for the review.

I agree with the concern that my patch alone does not guarantee idleslope-limited throughput on 32-bit kernels affected by the signed/unsigned rate-conversion issue.

However, this is a separate issue that is already addressed by Jack Wang's patch series:

[PATCH net v3] net/sched: cbs: perform rate conversions in signed 64-bit arithmetic

https://lkml.iu.edu/2608.1/09680.html

My patch fixes the overflow in the transmission-time calculation in cbs_dequeue_soft(), while Jack's patch fixes the rate conversions in cbs_change() and cbs_set_port_rate().

Both fixes are needed for correct software CBS operation on affected 32-bit kernels.

I believe these changes should be integrated in the appropriate order, with the rate-conversion fix applied before my patch, so that the complete CBS functionality is restored.
