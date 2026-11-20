Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795167074;
	b=y/tfK9EoQAi5tfkyaIW/tIo5cEcYKZ4XDL+ce/awbxCVrAHr34m17V48Is//OZliPzKT
	 n0VYsH6yZR9zFl9L7k2/M48JddgPTyokRjkWZGCmI11QRieQ/TRf/AwjqCjm0xPx9aaNC
	 LV7rkhTI+RviUC6n1JDVXtCURNkx7/+o0Nz/XAKU1Nl8rQ1sEskkb9h5gAo7hSMK4QNCA
	 I0BlM3y7VdAJj4nVIG9EtVaxiZ0acWqBZFEkAhnpMNzT5xh1MlzTNbYiLFjy9I5iqSyTK
	 KryrCoYQsHrw0XU/Zprb46ylC6s85E4X/wjk+ZJPvk7rp8XOfI4EIUXt/WiI99SrFPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
	b=r7BcYMNECqTOUlp8HuwJbGYlxVM9mV4ImyahOtnGaos3EltmSus0Ra8N7I2wYFCASC58
	 2aTASfgWYiD/+Jkmb7V7IGn6OhA3gsY/SuR2WrBukYokgPGpE07AqDkXOj1HZcTjSshTN
	 p/HjtEhQeHnu2VFYkKRjDhB/OecDROD+JBJsQKu9+m96Yiw57Mh8GexsVL1ol5oMTMbBP
	 FGRzi1ViBHrvWRFMxN+UIaw0iJMlWWnRb2PJVhJRmTYtCH7dAQwVJAz6mcdHy/N5v2rxl
	 ohJPb4HRlDo0/KnONLDqaQ6FiJsLkLfVjXo8TBERbawxVf7vc4K3Ing3mceCF3G43JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HecZDQb7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC69E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HecZDQb7
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-862b9c2e78aso433479a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795167072; cv=none;
        d=google.com; s=arc-20260327;
        b=sj6ZtiJuGNe1bbJQ9nXyOPJ6lRxMl74qdLcY2PpCM5yMpA2HN/NwxAdvKH4z+aPar0
         0pbdLHy0AHlEA5en44ZMLQvsoggKR4PD5i8L6cIRljjS5vdLQppNmAjhR+pAXe1FhbHq
         rz0r+SkawTUlE1cQIAsfEvZadnLn3NU80IHS5GTJj1O4APhsNTLar0Zw/IZGhn9LfPA9
         xqiCfCQsx+xgFYEKT4OkfsqL7DT5rmx0kMp4uOC6jKztnVRIK869a8u75wu58N8z/E1l
         y2vradBd4MbQcppnq6skb4WUjEYU15dwRAYSKkXtYdTnpE/+Gh5EFM9qOnOX3Jduz1tM
         MUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        fh=OpazLrTiiWjdzCGClodna+/iPam6y3/FH+Q8zj8L+A8=;
        b=pzL7geHFuvQXkKY5RGhJ32GuL3AfzUZtv3tv2Jd+k1OUbu6+UpyQqCCH8UUTy/y9NM
         tf1+FEgkiGI8CR5wIGV4w1S5Wbtw/9gq8mCnQMy+6t5tBozeQkPK0EVE5TERCIa2vvIL
         Uu9ZzUkwAxwvleJMWhgA9u5AF0H3VY0XROL8tcFrPAbwgNQLtW4sIslYkXMyFujUckjH
         cMn5z+dajI08bpMh8xAMlB6ECbJ8mlLmPjKgpw8f5hnEseOialnjbX7i8wcqj4W7UJK9
         U/YyVmCSkWMT0XkyNXwyNfI5j6zbit1QIEolyw7xfHTBDOdiMqdwutePAndbKUDrt+BY
         Ovyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795167072; x=1795771872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=HecZDQb7CVbdeNhyqELK8mZSGQ57dXFWoER3l0AH6+yx5s0ejZrONtGeXBWlJhLiBH
         QzLZkzyrbuTorTMCDNjmhx5b89Lf7UdN0/FvcT0do7Rhk1Mq/F3TxADF7VMlxgjT7J2A
         j8AFrO4OV/VYhwc046wuoaLGgw0tdvP/vQEB/o0iOpCjOOe6gqukg0sF0Xw5ID+7xmYC
         U4syCqx59aikiColh7/aHtpGEE93Co09aD7PVl+oy9Frc/2BRfjfg0620KYnd0IanT5D
         Py/bWFv9dl0PEqOGXJrXhd5E6mpzzDDliFUj55wl4acvjRHteuK3WWBj25pfxz0vApNr
         3GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167072; x=1795771872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i941FDPhpmYcUdo3BnCKwVlDsg7lnYxXVRnzu5LkiA=;
        b=JMd3xgU4wgj0zE6GmxwWkqkSfB4UfVP0FqOYIZS2KDv2n9ja8UXNz5wgc4qzxec2cg
         yStgIWT6vlkbhMY6DTZZvdsx2rFRQ9OZhtrpeYEjcqXZSwYEyPFDYA4JZKxbfIQz1iUW
         O7aeKNFoXdck1O/hTQJpxEvF1r9Sgduc8SilN0p0+K30Sa37/Wy0HuTQIGiPIeNb+7GP
         MkopsdNOq8X3ojM4cOtL+i+wwhCTBj8OASG9f89+gOLW/CiMHdorhLuNHlS/oewp4qdM
         WuVKDhEgYQ0nBmPen/yxRmb40Nqy81rI/+Gzu9q0CFXsuApKrKcZsOuhAWdJbxn+lNv/
         qUQg==
X-Forwarded-Encrypted: i=1; AL+hErH3NIl9qEHhGYiWDPHGBj7yC1YLd1NnJ3tPejj6UOu34L1+OTfTjwevDyWw4TosYY3AowS6RXQRZohO2L4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xx12fCyHNZx/GsWWjS0wRP/Bu6CWXgSnusw+VKG4XrheQikV7
	76c/JQUPh06OcTPSoWrM8HDsPc6jny7YhKUqQTZUOgNH61vSurR/65QFHLamuPrmv7ebrQKs13M
	pxiApg3WsddGLPyOzamxrz+qc/aJuzvU6HMnmo27ReA==
X-Gm-Gg: AYBFou1eJOyce9LhYDx/b3I9qViBD60JpkEpGgUifZPdfFKmMRkXT+3dzSRSrxBRMW5
	ly0bcfd+kJq1uYg3GCuaAtwK2PkGqsEuOn4B5PtbMACVWzfhOribU9hRWVC4nK+aYUgrp9Zmwm1
	K7fOL6PHbCcejngtz3XyhUQu7IteWkI99awVkNvxaocZuymUP/+5wCVuEUysrAfKeZmxEIZDwIf
	EZb4htkLfZmwgfp2/A/QoXkgyR46SRHZNAwbB2IeNEh+dEiDcGt1GaYS58YCsHgtSsr67+F/3Em
	tnqW+lwakeoRHXD2hjBftOH8l6FD6nXdM7OoJ3CHlef9sthtt0P3JpyM5ki933DtTuNpNy0Oh6O
	keAzh2BBNuobE+1EO0oCzk/7ZH5+xh0SE+AjIRoKpkiI=
X-Received: by 2002:a05:6830:6814:b0:862:e9e6:6297 with SMTP id
 46e09a7af769-86315985934mr3086650a34.18.1795167071723; Fri, 20 Nov 2026
 01:31:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop> <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
 <av-WvzoxSv7QpMhQ@thelio>
In-Reply-To: <av-WvzoxSv7QpMhQ@thelio>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 20 Nov 2026 17:30:59 +0800
X-Gm-Features: AclHuK-k8TRNXUVZzhRA9w-uB92JwpYAjGJmp8KpAUe03HieCcNAOF5c9k-Hbw8
Message-ID: <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
To: Drew Fustini <fustini@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
	Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, 
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn, 
	James Morse <james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Fri, Nov 20, 2026 at 8:39=E2=80=AFAM Drew Fustini <fustini@kernel.org> w=
rote:
>
> On Thu, Nov 19, 2026 at 07:00:21PM +0800, yunhui cui wrote:
> > Hi Drew,
> >
> > On Thu, Nov 19, 2026 at 8:09=E2=80=AFAM Jonathan Cameron <jic23@kernel.=
org> wrote:
> > >
> > > On Sat, 14 Nov 2026 14:06:21 -0800
> > > Drew Fustini <fustini@kernel.org> wrote:
> > >
> > > > Add the core for RISC-V CBQRI capacity controllers: the register
> > > > layout, the capability probe, and the allocation operations that
> > > > program a capacity block mask for an RCID and read it back.
> > > >
> > > > A discovery layer maps the register block and describes the control=
ler
> > > > in a cbqri_controller_info descriptor. riscv_cbqri_register_cc() pr=
obes
> > > > the controller from that descriptor and adds it to the controller l=
ist,
> > > > which stays private to the core. The core owns the controller state
> > > > after registration, so nothing in it depends on how the controller =
was
> > > > discovered. The caller keeps the register mapping alive.
> > > >
> > > > Tested-by: Zeng Heng <zengheng@picoheart.com>
> > > > Reviewed-by: Zeng Heng <zengheng@picoheart.com>
> > > > Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> > > > Signed-off-by: Drew Fustini <fustini@kernel.org>
> [..]
> > > > +     /* The resctrl glue keys its domains on cache_id, one control=
ler each. */
> > > > +     list_for_each_entry(other, &cbqri_controllers, list) {
> > > > +             if (other->cache.cache_level =3D=3D info->cache_level=
 &&
> > > > +                 other->cache.cache_id =3D=3D info->cache_id) {
> > > > +                     pr_warn("CC at %pa duplicates the L%u cache i=
d %u controller at %pa, skipping\n",
> > > > +                             &ctrl->addr, info->cache_level, info-=
>cache_id,
> > > > +                             &other->addr);
> > > > +                     return -EEXIST;
> >
> > A controller with the same cache level and Cache ID is not necessarily
> > a duplicate. A distributed LLC may have multiple physical controllers
> > managing the same logical L3 resource.
> >
> > Matching controllers should instead be grouped into a logical component
> > keyed by (cache_level, cache_id), with the physical controllers kept in
> > a linked list. User space would see one logical controller as a single
> > resctrl L3 domain, while the update path would iterate the list and
> > program every physical controller.
>
> Good point that it is not a duplicate. However, I would like to keep the
> scope of this series from expanding, so I would prefer for that scenario
> to be handled in a future series. The domain id is the cache id in both
> cases, so it won't be a problem to add later.
>
> Do you have a platform with such an L3 that it could be tested on?
>
> For v13, I could change the comment and the warning so that they say a
> second controller for a cache is not supported, instead of calling it a
> duplicate. The alternative could be to skip the whole group if it is
> a problem to just leave the first of the group enabled.

Keeping only the first controller could expose one logical L3 domain to
user space while configuring only part of the physical resource. Requests
handled by the remaining controllers would not receive the same allocation.

This topology should be testable in QEMU by creating two capacity
controllers with different MMIO bases and making both RQSC resource
entries reference the same PPTT Cache ID.

One possible grouping model is:

1. Initialization
Group controllers by (cache_level, cache_id). Represent each group
as one logical component containing a linked list of its physical controlle=
rs.

2. Set
Let the resctrl domain reference the logical component. On a schemata
update, iterate over the controller list and program every physical control=
ler.

3. Get
Read the configuration from the first controller and verify that the
remaining controllers report the same value.

4. Monitor
When monitoring support is added, read the counter for the same MCID
from every physical controller and report the sum for the logical
resctrl domain.

User space would continue to see one logical L3 domain, while all
physical controllers behind it remain synchronized.

Until this grouping is supported, it would be safer to skip the whole
component rather than enable only the first controller. Since this is a
valid RQSC topology and can be covered by QEMU, supporting the grouping
in the current work would be preferable.

Thanks,
Yunhui


>
> Thanks,
> Drew
>
