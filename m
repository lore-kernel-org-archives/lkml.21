Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936961;
	b=Vq7qlrofbOk0oP7leMsCEydXSu0825OIRzPFFI63TE6mDZRq8/MmowgGD1CL6MdLVUFB
	 e02DnHMx5X8Z121K59A6LdsGvkBkvaBO7sGAmvHy1cqFvwaepdqEYtM5sO/Ir51CAyo1r
	 a3hfDmULjqGMV3cg0VA82jiDOT6v3x1vprpprGNA7LhdPlptvx/EvleOOYtZqErizSTsI
	 AsAHfnblGB/TC5++hB9HchPo26CIavvCNdUCs592kvYpSCI0oO4sSEkOnil9H7EXbkO/s
	 dA80ppjI7R3hsxsjJizLgLz9BsEup87xAW3n9i2Hk6aPyluD3TUyjw1cD7gHOCAPgUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=DiwDSqqY3noD1OsmVqWHD0ic/HvrhuFYXysk4k3SnZc=;
	b=YML4rED5mRezFINnyHY/DLHWihEzS6kWd2f5roAx2Byzb/XZmgabymK3Tli1TSO7i6zk
	 pO2v5OAX+DrHlGteZWbfg68RriXDqEloi7TEvehif7TKuj3vl80a2z6CDNaPAjASYrPVl
	 9fOXU4NjjkTuAAV53ukvLGtyBzEuvJhWm9xAtOD0SMy2oYGg2JLrw3+E2RI3xcqgvkaRi
	 tHYJXPzUl6NL9gV7U+awG95JO5rDbKtKTnWw0S5NV4ZkizbVUNYagN/F0qT4WViD2QX2m
	 6jG0XuTOfh1TD45arsFsm82lK7NZwaLwd30xZ+k7N22su6xyBtTvf1VOuUqIjRNHPgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0KzhbPl;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C234606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C234606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0KzhbPl
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2af4c8d00so189542c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936960; x=1795541760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DiwDSqqY3noD1OsmVqWHD0ic/HvrhuFYXysk4k3SnZc=;
        b=W0KzhbPlCbSkBolXiCmD6b7y4XivdRe0ATUXhJnCwm/FUiIUCGCaVmBlrdoJ0MiToT
         hPn9mZhGwzKdCWgWwRy36z5YG0t+Psv1iQeRIG9/dMaqLn7ghaec4omgT2n+sZOebDu1
         H9CYY6sUfd9rj+lI/2BdulykAt7O39JnGP5RCoPqzSVpvBZDoJlDFCKCWd2RWrKepP+q
         mnEBTeKW5beqXu1kTwE1FK1KsuDK51HLy/QCynmZxce4uJ/vq9yrAMa8/HeM/C8sGSze
         RXkVUZLHqf3ZosazcJDiqOEIV5rtJiuInK9OUeQv4F71bhSXPubgShcGmTkC4Ra5pxx3
         c7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936960; x=1795541760;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiwDSqqY3noD1OsmVqWHD0ic/HvrhuFYXysk4k3SnZc=;
        b=TfCblqIIWCqskYJZdcPzpm3p3ckN5QUMwz4PoTYpxQ9fNybW50HWATaRwS0kFv3ocJ
         Osrxbl/eLoM1qO4yE/MquJMjIIYx4PPayyeOf16Y3JDcW5ELQfG1rjTvwdAd/SwnDyke
         eMWQ3j0ePxWerssUO1+EsGByEfJriKdyrtLMQncF4ibAYPuvhbAbIS5tFg4aF0GNjtA1
         QZ52P6iircWraBgFRgc301TTe5FAxI6O7SN1OGHX7kA3hZoja9KhLw7AhqzXKGVLSEb9
         2fEMKblnYzLS9NybYkWCK9hl7/is8UL2nVF+zXWlqN1HJijwbr3QvqJnvXBw2XHvZc3g
         VEYA==
X-Forwarded-Encrypted: i=1; AL+hErET+rCUiQVmO4XkkDEHa4n58riDohsjojJq/8IzpFyYv/qOjwjB5CjuyE6pNBGaEweaumaQ1xh48SE6sgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z94dAKm2+bxJ9jd/5NvqTJBrfyOc/D5gEk8A2sde6mWau9NXPDG
	9EeYfpYr4m+Q/DVibN0/+xD8SQVMz8gnt4aqqs6AauGJlLLtBNTDO7Ky
X-Gm-Gg: AYBFou1og3Od5Hao3yLv6Xx7KE+VlCTTRIkkB2HCrmAkKSK47WCiuVGvSc1uuRFSxnr
	guT/nw69b8sqUeKyC/T/i9GuJEv1gX+B1O8f7mQ8V+8MtOy/NQ0pPwRSU5o56kg0Ai0U1CyQT68
	OCLKsZAqVm7xMxmXTZnXlCEk5tFCLUxnHq54Pp8B6ibD5iqDzL5GqE8+vEv14YnwO1D9Tk/iL8c
	I9j/fF4UP3ga5YI1pNtbL6t2zbwuxlE9JQvPd1jErQiQoB+Hg6m6ooW/KZFMVHIEbMAZNbFJJcC
	0iofb44tWOZNmx+GCdienISGC5gzJdYAFVgVO7ItpegXLI29J8lD5wX4tw+7hub1pf4LDofdWJQ
	yAg87b/gET6oAUclgeEY+nuziwl9yRWXTwe4grdJr8jvjkwcYJY8j7dCIfddCI4+LX48tGkfucD
	RYBO6IbIb0cb9SHjOx7/SPZ+wPcW3CJxGlhyHzoIas8Mb6fYtRHDBuRKFStocYX22e7WIVOEqwz
	Ros0h3f7nMSlNNRljr7u/ubx1ybFckrakpntRuX/Sm+cjrqn6Wakq5D6VfNYMQdKAbJZPGEDSlL
	f97us/Vp/hMrV0tqEz7boStJI6R/
X-Received: by 2002:a05:701b:2058:20b0:1b5:3878:aa29 with SMTP id a92af1059eb24-1b543d355fbmr247604c88.38.1794936960214;
        Tue, 17 Nov 2026 09:36:00 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm61333595c88.9.2026.11.17.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:35:59 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCHv2 2/3] powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
In-Reply-To: <avxhmaXa7lsQ86EA@kernel.org>
Date: Tue, 17 Nov 2026 23:03:41 +0530
Message-ID: <tslf747e.ritesh.list@gmail.com>
References: <cover.1794572365.git.ritesh.list@gmail.com> <82c4973addebd82923c460cb44221f5b76146afe.1794572365.git.ritesh.list@gmail.com> <avltdwzlh07VZSFC@kernel.org> <f7834f3e-6c43-4b58-806d-fe4c07a93457@kernel.org> <avsn7Kn4a8wbB2QH@kernel.org> <zev77i3i.ritesh.list@gmail.com> <eb634d1f-cb08-44a8-88c9-e3b559c399a3@kernel.org> <avxhmaXa7lsQ86EA@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Mike Rapoport <rppt@kernel.org> writes:

> On Tue, Nov 17, 2026 at 03:04:49PM +0100, Christophe Leroy (CS GROUP) wrote:
>> Le 17/11/2026 à 13:33, Ritesh Harjani a écrit :
>> > Mike Rapoport <rppt@kernel.org> writes:
>> > 
>> > > > > > Hence, use the modules area for EXECMEM_KPROBES on book3s/32.
>> > > > > Right, I missed that on book3s/32 does vmalloc is not executable and its
>> > > > > protection can't be changed.
>> > > > > 
>> > > > > Could it be that 8xx also need a special treatment for kprobes?
>> > > > 
>> > > > Yes indeed, not for the same reasons but because 8xx ITLB-miss handler
>> > > > doesn't expect any instruction TLB miss on kernel addresses other than the
>> > > > ones from the module area:
>> > > > 
>> > > > Commit 4afb0be7ccda ("powerpc/8xx: Avoid testing for kernel space in ITLB
>> > > > Miss.")
>> > > > Commit 16a71c045186 ("powerpc/8xx: Preallocate execmem page tables")
>> > > > Commit 33c527522f39 ("powerpc/8xx: Inconditionally use task PGDIR in ITLB
>> > > > misses")
>> > 
>> > Right. I looked at the above series which added all of this support [1].
>> > So looks like 603 might also have this related problem (other than the
>> > per segment N bit issue), since it's iTLB miss handler only walks the
>> > task's PGDIR, unlike it's dTLB handler which falls back to reloading the
>> > missing kernel PGD entry from swapper_pg_dir. So what I meant to say is
>> > that, similar to 8xx, a new PGD entry created in the kernel's vmalloc
>> > area for an insn page does not get copied over after the task is
>> > created (/PGDIR allocated), on 603 as well.
>> > But since MODLUES_VADDR is defined for both BOOK3S/32 and 8xx, so I guess it
>> > gets covered by the same change anyways.
>> > 
>> > > > So at the end as MODULES_VADDR/MODULES_END only exist on book3s/32 and 8xx I
>> > > > think when they exist they should be used as follows:
>> > > > 
>> > > > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> > > > index b617b69452cd..856f4609c488 100644
>> > > > --- a/arch/powerpc/mm/mem.c
>> > > > +++ b/arch/powerpc/mm/mem.c
>> > > > @@ -428,8 +428,13 @@ struct execmem_info __init *execmem_arch_setup(void)
>> > > >   				.fallback_end	= fallback_end,
>> > > >   			},
>> > > >   			[EXECMEM_KPROBES] = {
>> > > > +#ifdef MODULES_VADDR
>> > > > +				.start	= MODULES_VADDR,
>> > > > +				.end	= MODULES_END,
>> > > > +#else
>> > > >   				.start	= VMALLOC_START,
>> > > >   				.end	= VMALLOC_END,
>> > > > +#endif
>> > > 
>> > > We already have #ifdef MODULES_VADDR a few lines above, I think the
>> > > assignment of kprobes_start and kprobes_end could go there instead of if
>> > > (IS_ENABLED(CONFIG_PPC_BOOK3S_32)).
>> > > 
>> > 
>> > Right. So let me use the following diff then?
>> > 
>> > Please let me know if this diff looks good to you? If yes, then I can
>> > send a v3.
>> 
>> My preference would go to something similar to 'start' and 'end', no init at
>> declaration, kprobes_start and kprobes_end set to VMALLOC_START/VMALLOC_END
>> inside the #else

Sure.

>
> I agree, it's more consistent this way.
>  

Ok, then will go with the other approach.

>> > Also - it will be good to know if patch-1 and patch-3 looks ok too,
>> > before I spin a next revision?
>
> Both make sense to me, feel free to add my
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>

Thanks Mike and Christophe. Will make the changes in v3 as discussed.

-ritesh
