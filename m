Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984621;
	b=OJFSRI+59C+9Z9AtxmsWpjFetjUfHL34Sm0sp6FQbUYf3jzEMrRz1WvpOsFK8YUZpFfP
	 RcyEPtIetNSUA4iwTkNs5WrJmzjtUNf3+P5QM/dp3XVGWa1SLNTVxBgdrWjKEyrseGkbS
	 UPhQSc0R3zhD38I6vqyYEBECWtg/YCLXn2wE6irXbRbEgS+Z4bGbHpfXsMSNtFr/dmaBk
	 p51JAdlEMIcAwPRlkXEBP7uNdY/G/hgt3en5I5edqqyceZarWw0YoKtxQO+DcicwFtR+x
	 +M3UnNAdACTKdpuxQStF5dpxA80Dl5j2QJ/1ZDcIkREMVUCL1rqFfdlHEzBoBpNmuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U8jV7OnHEFz0j+0ag5AfooSr+IDZRuR+qja3G5heTVk=;
	b=jbiGl4I95jzOlBoGpK3eJRdd2imSF4kiShRDAaiZ2VuMygqWWRsFbbO0xsw4Jda17pKo
	 Y+ekpLAOWnwwrM1KcNlbVZod0t2BGZtqOvNMBb01YUAT6cWehu1FCSOp3qy8RROv7K1Jh
	 b0euzu3KdjAm/3Bcdmdv+LdwSeuLmMF7DtoV/HqhEFSHvVSzzoGTS374m2f9fEpVfNrUg
	 LWNJhz4XQxNUMDrntq94WaTE6Fk6qE1Xw8xp0RzkhTCt0+HZT93o5J01VKn1qdgo2w45V
	 7oDaRvB79LDmIloaX0PWr87pR+fXzvxCtqNo8gpL9lLrFX/Tdm/Sq7rxCPLZDctxqlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0uXzD84;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C30A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C30A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s0uXzD84
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2efd432714aso2646865ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794984620; x=1795589420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8jV7OnHEFz0j+0ag5AfooSr+IDZRuR+qja3G5heTVk=;
        b=s0uXzD84SDYX/NyRfUu+pmyAx3omQcq/Npa12/ohehJ37cs5tojh1o1ewVq72p+t6O
         2ANwHvn3nZk/qCYXz+8aAB2FH9S3QPhqMog0+dT0kw4pOXg2G4UekNHEoVeYR7HLYWq5
         8/7l9qh1/kg2m3BmGP/zIZh1bIr198lrZRgAvzORwYbzlzXiCdkhHVpnY8o5+Oj5O3j5
         QCvwpKBRNpKYGu9ucjJjfmZqIB/R5KccPX6rIMNVF7CNmb37v6OU1g8/oxh9DFiD2BK1
         V0ZqfK2pr9GKZ4+gXnPH876yIB7FOGlU7q/Ohynk3hTGvUXGTPbs2w8AO6Ux+DweHVYi
         yhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984620; x=1795589420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8jV7OnHEFz0j+0ag5AfooSr+IDZRuR+qja3G5heTVk=;
        b=TcLqV9Rf39WvGbx5AE9YetTs26Gz2RTMgwXCOUE86DHwE9Iwz0GEowyaxtPgDBHKa8
         5APP9GAfyrPWZOvmd35RmLd0sq55pNjj0GeDFqVTVnXN+mJxJ8U15xM58WWDUVo5tTmq
         ob1+JiucHxrV3FQMjmZdKR+gqN/Du0NgOF2Vg04Y8nyKeDRjYj+2DCtzeDVw9dXdQVl9
         v9iIRVLBqQ+ye3i3fHOqgMWAkxi2+Y18S27ZESIuX25fa7kw9b6VrPSfwqlRza6Oz21K
         eZe/GtYxeMqeXrGGjZOC7dnVYHGM+Onmlzc2PPfUea8p5YTEjrJZQED97A6CpYbe3fWl
         LchA==
X-Forwarded-Encrypted: i=1; AL+hErEkQsfa4zZOPRgv5XXIs/m2o/15fBYaKOVlk1YxS+e5GETzudbxAA320xmbWZtNS0gq9ClupWm0M9Y8xdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rR2SbrkL2HjTzGN54lPUvy5POpDvdzzwWx62PJDPvUa+omU7H
	utaDycnSKcXhTyIBxKUu/P/DEkTOQzvHbUbzIxVMy02MydKnuh+EUXrx
X-Gm-Gg: AZFdTZdIJLmvzjMXTnHGSeAESVcrne+s+YEURVGj8x+8tmxyBPK/yk3lgyj5qERwg0J
	IjafAGjmmjemyqJdKlgGESBMkkPifJDOwz1ZNPpF+FD7SGo5XVQ7z2lA06De8ntCYsBgU6HwebX
	vrhC5COgIkyfNQehe9NT0DpcnfPKbkricyT37tQB7PPX23XlCeKX8FUA1heSyiPZYRpWH6XRgDW
	SMvGjKl7b1sUeJzLYKeLJFDoCiaZ4MlXslCbTzndKTJUiiwLLF0dTAVeI7VozJUHEe7lRx8ADPY
	YY83usQXpW3WcMot/DbY5HjfbU92lSOqmyHKmcXZJCeTnNozOo4+Ev7lI0x/DLn6gSTFdXEqq7V
	BRJ/7XSafD1XqgR7x4dCpYutCRraTJdWqxF4S1Q796OdpTsLxzy7fqeepM/xNFtVRXzg4yslgum
	b4N+kDg7PFv4vZxdXD1o1aZs6MDDTabLl0NDwDw5yv1rXHnYOGXDpSGV3ES31G1kyvLL3sSq1Pr
	ecV/pcR5POrwtJAAsXTkzDnJvcSj8PjFQTs+ac7xzNHF7JFRA3TYjRDR6ozylJf8yIv8qClTz20
	aJpI4bYSKwhxLLxengd7WlJdXcgUgWQSWPVEbc82QeTgv8DVxOjwB1Fb25hMS7KphO+I8VNfg2m
	dRQ3twJ1T5utoMx6v+Lw=
X-Received: by 2002:a17:902:cf10:b0:2ed:e22b:77a2 with SMTP id d9443c01a7336-2eff7560dd4mr16662645ad.55.1794984619740;
        Tue, 17 Nov 2026 22:50:19 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62897d0sm7773615ad.64.2026.11.17.22.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:50:19 -0800 (PST)
Date: Wed, 18 Nov 2026 12:20:12 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	chzigotzky@xenosoft.de, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, 
	ritesh.list@gmail.com, harshpb@linux.ibm.com, gautam@linux.ibm.com, 
	amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] PPC32: Fix hard_irq_disable to follow tracing and
 lockdep state
Message-ID: <av1KYTtbzgwtDKn_@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20261118051419.783878-1-sshegde@linux.ibm.com>
 <20261118051419.783878-2-sshegde@linux.ibm.com>
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
In-Reply-To: <20261118051419.783878-2-sshegde@linux.ibm.com>

On Wed, Nov 18, 2026 at 10:44:17AM +0530, Shrikanth Hegde wrote:
> On PPC32, the code for hard_irq_disable has diverged and it doesn't
> do lockdep/tracing anymore, leading to use of both local_irq_disable
> and hard_irq_disable on PPC32 to overcome those.
> 
> That is un-necessary, instead simply calling local_irq_disable is
> enough. It disables EE bit and does lockdep tracking.
> 
> Subsequent patch uses this API in KVM code to avoid the warnings.
> Wider use of it is possible, but it will be taken subsequently.
> 
> Cc: <stable@vger.kernel.org> # v7.2+
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> PS: New warnings would have started since commit 
> 12013e3d4695 ("KVM: powerpc: Use generic xfer to guest work function")
> which added local_irq_disable for 32 bit. The proper fix may date back
> years ago. To avoid backport complications, keeping it backported till
> 7.2. So removed fixes tag and cc'ed stable.
> 
> Also, 32 bit shouldn't need hard_irq_disable. But that can only be taken
> up subsequently.
> 
> Also, below fix isn't needed anymore.
> https://lore.kernel.org/linuxppc-dev/a14571be1897955f43d9994f0e093de3ada6ecde.1793447880.git.ritesh.list@gmail.com/
> 
>  arch/powerpc/include/asm/hw_irq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index b7eee6385ae5..ddb850e62abd 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -464,7 +464,7 @@ static inline bool arch_irqs_disabled(void)
>  	return arch_irqs_disabled_flags(arch_local_save_flags());
>  }
>  
> -#define hard_irq_disable()		arch_local_irq_disable()
> +#define hard_irq_disable()		local_irq_disable()
>  
>  static inline bool regs_irqs_disabled(struct pt_regs *regs)
>  {
> -- 
> 2.54.0
> 
Cool, this makes things simple.


Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
