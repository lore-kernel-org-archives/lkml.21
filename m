Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556595;
	b=gTXhHJzJlgHgdrgWE5Ned0izgkA6V7A1+r8oO5nbE7M5+cH7OlfHUBIegEZTO0yNwhXv
	 L1zvo6ZDlJp1jPoGysd21wqyyisl50AqhlQUKS7331IN1zUfirgv9EaTCTypAsy17Rlxn
	 a41xSTehfe2GB/YG7rGUgIqteGGVcfOuWm/6QpBDiXMNUOG5uOHXdI5Y3JohYNXvhdA6D
	 bmyS7YgDptM9D6wbXzI4PCg13nOHLRAqva3Ze1in96Ie9xx94D5up0sd1gPcnEi/5epKi
	 4R+g3zr+bl8nmKKoMdmlRUIfS9PmshFWSEY9NX2sy7I8UyKR9naS8X4aTJWXo2IPNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
	b=iJKMWaTSAs87PsWnJ4Ze4jJa2SWBOVDCLpAfwBlTZ8TXotiYwOGbYTi8kb9FDWZUe/X0
	 1OeWWlcgdD062rEQDlrvVD6RyFWebwmz+HIZ5FfkTTaHVHxbXuppLxHCY94CZ1aJ827tU
	 XBJUqFxzjshs1lWill0RD28NA41hm5S/GibQ7j2jmD/50Mkp3rAA5dQoq0Es2gV2rjh14
	 VoV11xUtNzd3OLcBk8pW06+X5K0vHC9pe/K6cTAa+PUxcf+wlNbOQOxRXU7UH2zn1cE7z
	 h7Ki85RsjNe8LGl3lYH7vBdVvBfvAFD+6ujNuWn0W9UL1Uca2EswfVLC4dxhOI4Og7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LgHWBrb;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8499F606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8499F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LgHWBrb
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a511d8a394so518641f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556594; x=1796161394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
        b=0LgHWBrbm09GnvzktQXlq+YoVhTra+a8APFk5vqOolCQeExJ2faUuCcI9hv+G/9vCv
         Y67rTSPHFaLPgYL80KJv2kRu48ClOL7d+Pguh3uoSPikRzMiRgMmwMYXC35wXS9K486r
         VxHTpTW5Q7cqFI6ZBAqWwec1Rt4r5FgfiLu6EI0euirfCHVplEa4awaH+j9cesVX6RRk
         UJJg18yWHb0hp9bSHAWODvxczxKVMBykGIdWtrgK1bvLKecrE4Yd01mpNRSp3MjWSY3p
         mDNbqM3QgFP2ND0EuUIcaDnK5m0rdjhwBYfdGOzk3ifogWrpN83n5RZZMDEDu6dRiRLy
         z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556594; x=1796161394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dgevjOWuJAYh7LIS5HDx0mssJ5LCiALLAiYYaKE9M4=;
        b=dBpWwqGTIN1sPgBP9ok7uPHDBOu4kT0wH4A22/hr2jeK8XT2t6IGUjI3lzc/JGq8La
         jMlVzhpCnUi51rbkTaGbrd/5JmF4yqrPJh/jSZrkKeWi0QeNbFjaAlpHhuoQILHO9nAg
         ctNopnj8GRiD/rWf9fa0mFRQbzD7R0JHNqv9HOpOl7e7HP8acgYm5iDq5q+7A5h3zsee
         n8BJPpjQ58iU0Xyto0HIZhZ0agoAGK3reitsq+Xl3asHN+6v0UbNEvVDpWXfqhEeUANn
         CUYa2h6ZZ9FwEtpyGubrRlpW1AWPZBgYmMfU0hEiS37wyNjQWppMu1BFyijlAbMmb6oy
         UF3A==
X-Forwarded-Encrypted: i=1; AL+hErFGPdSIvkOk86D9rTLMI+8Wv0EhfuFiKFsRWe+qj94qpQDb3xQnDhFvdPKc87AZsgfjuoeK/AkfB5ibLVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kEJFSww1EBhw5ZF0UUfjMWbCpE6b4ro0sGx3S7Z9Ez4KDxCUV
	OboFdiD2EwnFbz5+tokZG6gds0zHUA32E6o2apG9uiAgYCX1k+qh3iz0
X-Gm-Gg: AZFdTZeGZynvy/3AbUow7w8KEAm5KrsPaNYFvG4mtLPM3tnCSXTshU2TrH929b2xUFX
	ZGVDLckr46T17hA1SI76qNCMDVzDouD3kyLKIUn9kZS4z5EZ4OFh0SCPMvKgV0sa/DlQbzHIHBn
	/N0E3ntqqG2BwqZR7Q6laThw4AIs8/jwVtJm46YnNVfW/CVeN/RnwnIAeb41C5d9/OcUdJ9x0FV
	jPlzuzVdQyAmXzkvryD0xPIensofm2rbeudsGMwZ0BgkG6f9B1XdrmarcSyreaFVmZDn+XvKp6R
	f40tzN4GltdluKQvZ/enIE063DlfKdhJonqCwq6sWuQx9b2zw4VbSIsdw17xZoif2nlT9CSU8Pj
	sJ8lwv+O02LjXj97Nw9lmNa6sVGMR8xelW9R7S8gouyPGHEI2iFfZZvEebIUgZlQx4KOxfKdJr7
	xfThPmQcI6UsHJObNbFhQOJ4itWf7vePuOoL7NgBe0r5DbyZy54wOQ3xKf2gxUHNV7yJbMGqAvx
	bg6+tbE0Xx12/ox6VQOsPl4kyBF39/sIftuosLiGNw/n4xBoZGm24l17jFWWvpui23y9uSJjmnF
	hE/yBF9bWzo9MzQBWNrPL3k0W4SiO08hKDKna2LmyCU5HXWLavrDo9i/tak39mQtKR1R
X-Received: by 2002:a05:600c:8284:b0:4bb:6c01:de9c with SMTP id 5b1f17b1804b1-4bb887f55c1mr283837645e9.2.1795556593828;
        Tue, 24 Nov 2026 13:43:13 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm244195265e9.0.2026.11.24.13.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:43:13 -0800 (PST)
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
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Tue, 24 Nov 2026 22:42:55 +0100
Message-ID: <20261124214255.12280-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123140946.13992-2-tianyi@cloudflare.com>
References: <20261123140946.13992-2-tianyi@cloudflare.com>
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

On Mon, 23 Nov 2026 14:09:47 +0000 Tianyi Gao wrote:
> If you squash this patch with patch 2, feel free to keep my tag on
> the result.

Done in v7 https://lore.kernel.org/all/20261124214025.11603-1-emmaonana18@gmail.com/

Thanks for the review,
Omokefe
