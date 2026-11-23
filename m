Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437370;
	b=n7PlHag1TJQBlOwpOdG4NpClFCqBLAjR5/CHathAg4pl+05XXnDSP6E5Ya/YjFay/GuO
	 U+QqeHuKf2AVGAc2l379n5sCxstRIYSYIBUAxzPmd1i6txXG+zst/Ukr4Yz0pgbDHr/cv
	 uLtCNOyvRQrVr+PgpawFo/Xb26KjbmHAAv80xIj6xdqtCK7dq3RwNJeVgkFdd7ThgyZFc
	 LHEzODOtt/FoCjFy/NQjU7zVfE3Cd5SS+nKvSVOGIiuFUYCQDERWtcBdiHRSmoiAEuyGw
	 hVMEAWV3TMbdxYWufL8zk6/J9VviqYW12KlJiXbGrNgfaSYUZi5nsos/ETR/SQDAa4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
	b=JW76nDR9Fi5uJJOqGdpEJf6P54Np07pt0CyYbDGI2m3oVBNvNqRwnJfYCFVoTq2dbvq5
	 goNxSvaIDAlHDPpJbrcPCI6spcHGskX4dEEEshEwZemE0II+WoOtdvEh4H68XmSutaHFp
	 KxYJrfEl+5G7xBQM8uBhnjOZTDNLBUxMyI3/6aN2QoAmaZeL2fxTdNh6gtBd4mku/e04U
	 7AnIEBUiwzH9q33oTG3HbU8nH1K07VAJGu7LZraoXwxcvS/c44Viqan15bcw0ai7iZYFv
	 gkEsCMbMoxg3pq6DypIYzv81oWSgur7Lgj04TdyfjxOoaJM5nFaM92LCzvYTFL/o6dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X4d4kmW8;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD9606A68F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73CD9606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X4d4kmW8
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1767084a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437370; x=1796042170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
        b=X4d4kmW8MoeFSWSHykypJXTCQ9sxdfL8zvhoE66K6Sj3h/x0tCzJHWjyeNcIqmYJX7
         33uMM8OD9rktP9s+hYv7SVfmx+FeIdJHCtXn6/T1yfNIjSZg6zr5N2/uBNPgp+s/dvmq
         fUnJByPx57vrBt9LcrpB47M8hjODYv2XAtjtC4qshjGvL+5K3hrV5fnWQwn52FDlDKQC
         Yj9k41pAqekeHYLpXkL+XAmZk9gQ+eS9gQQf+F9TS75He2K9ZB1bfry+pOx5aQ9nK69E
         OroZyQjtslM8K4H7qnWIyby1ff9PkyzT4OzlTcTLU5wRVR01qaS4fU/cgvcd5E53uwQl
         gBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437370; x=1796042170;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/uD1Gm/ThsK3UVlqQr4l1VJFGDwFXp2U6warxXaR1w=;
        b=lJ0IhvaT9x/0loOD65htNH/X/KBNPl+DoQvKoGGBY9TKGcfY3nh+Ns5kkQwCWy0urV
         1tsk+nxqtoDjSXZG3ej1+d8SPFfoynWZVY7LY+9c4N+hDOvTwMiyizeliNjCgJzEikoe
         OzxF+56fAxTNQsJXzUdL1+9zx/nE0BHYC8TuSPFjR7aayQR8JzXT55FnAwF1BFYJ45V3
         IWAMJR+HAONrQ2/OZt/EOWVlkHzUVN1MdfjuDlJ8fTWx5Dd2Lu5DPeKaGttbjqCWNjN1
         PuyUebJDBA3ipv5XDBQz3UrilsDbrH8Dqzg3x03Gnz9O9mekdBtLUYqB5gxILS0frHdb
         i9dA==
X-Forwarded-Encrypted: i=1; AL+hErHg5aJnkllW+dfcHaQrAfaOCHt6z1YVYGxZvJU3DnLZELvk+kMW1xyFEmqLawYxmPhggsSNwAwI7E9hQfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Wzv9YVWLs8FcMLrzBPsdMWJv4NpgFFzxIf/hb7MnfNFxbVe7+
	2Sw2FhNe7Mri2WXL+P/UaN/5QSKWdMwLN8SYfDk91HynZuXMX5REpITo
X-Gm-Gg: AZFdTZeExIAkBXt1KLzhQthHCRKgVnc2PG8jXkZalpNVbXrw3mvNIbD/OfL+1xZx/9i
	EN+Um1xk7tInPE7NQVJUhnCs0FwhqMfVIMZY70OmOOKNvyj8oeK8whBJ/RhvEz01M69qD+243Xl
	tdn0NhEUemRF3eIHTKz0xKQm2BFALz+E+A1KW01kFByG8nKoRaEsT9seU6IlLWQtcHKb+CuS36E
	lcc4joDiBSpg3bxGnFjzvwFFmTnz06nWzP+z0+Bnu94Dgo9iFkIkPL5VbpE2IKtLyNM+0ZH/dF4
	uIwN6GY/Zkk0mlX7eMalwckYrtSbnlVXKNNFSjtjQTRXQxq7IhOnf3aqcf30paS9CDhQWuXZAwk
	9C+qzXKbjIOeJSy+dzKY2ndba+W0qw4bk91NxZ29aDtVlKjwboLAmmTz3zQiTIaCDmBFmOETfCv
	GH7HR+fHDa2qt4U5YnxK3TjqWbs9suBqkZUEuJivZLaUx+YMUaW2DAlWVTOfFFsDfDGRcP8wwzu
	qMBXFfnxvpfQwJ0UEnfOrLTrnR+XK4g7B6SvS6w8zvntS+8qiEWsvuZ9Ds7JUB4ajf3sVHB+PRY
	7Al+4jQijnbLmdutt6AfxE+NgDNtbDNHA7e6X07JH6H0T8Y=
X-Received: by 2002:a17:90b:3c07:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3b41c9b2529mr10221008a91.13.1795437369821;
        Mon, 23 Nov 2026 04:36:09 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm6119715a91.3.2026.11.23.04.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:36:09 -0800 (PST)
Message-ID: <7225496f-222b-46f6-a609-89921d6572d7@gmail.com>
Date: Mon, 23 Nov 2026 20:35:57 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 09/10] iommu/riscv: Add
 riscv_iommu_attach_dev_nested
To: Andrew Jones <andrew.jones@linux.dev>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Tomasz Jeznach <tomasz.jeznach@linux.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, Tan Chi
 <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
 Zhao Qingye <zhao.qingye@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-10-gong.shuai@sanechips.com.cn>
 <awG5Q7pmntSme1A2@orel>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <awG5Q7pmntSme1A2@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/21/2026 11:48 PM, Andrew Jones wrote:
> On Thu, Nov 19, 2026 at 09:27:43PM +0800, Gong Shuai wrote:
> ...
>> +	if (riscv_iommu_bond_link(s2_parent, dev, nested_domain->viommu->gscid))
>> +		return -ENOMEM;
>> +
>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>> +	riscv_iommu_bond_unlink(info->domain, dev);
>> +	info->domain = s2_parent;
>> +
> 
> When moving between the S2 parent and a nested domain on it, the parent
> briefly has two bonds for dev. bond_link() puts the new bond after the
> first bond with the same GSCID, which may come before dev's old bond,
> and since it's then dev's first bond, bond_unlink() removes it. dev is
> left bonded with its old GSCID, so its new GSCID misses invalidations
> once no other device's bond has it.

Thanks, you are right.

> 
> Passing the old domain to bond_unlink(), like I do in [1] for a
> different reason, would let it remove the bond matching both dev and
> old's GSCID.
> 
> [1] https://lore.kernel.org/all/20260928143113.49838-12-andrew.jones@oss.qualcomm.com/

I'll use the old domain to resolve the old bond domain and its GSCID,
pass the latter to bond_unlink() as old_gscid, and match both

     bond->dev == dev && bond->gscid == old_gscid

so that the old bond is removed rather than the newly added one.

Best regards,
Shuai

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

