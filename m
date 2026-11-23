Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470572;
	b=Oa1iWzvz85xflWp4/6GvX91Vhz+wxqTFdtPUUplt4MyYNsq1uQmW5Os9fSAbhI3KSZT5
	 Bo0N327xREbGwRElz+KblqIEOOBSN7EemFxriKLCsl9Tl37B2OJnbwwaadMMLIpGTPc1g
	 UftE/dV/By/NFwfeEaHiInDocNLJWpXZO2E0ztU4N6J+aVYfZg0pMGqK+Na+6jfmb3/5l
	 3L7A9oBLVJ+82rv0Dpqs+lYJ6x0E3NZjfNc8UKDoylpnrtQF4760cSvtAFFlVE4vBJpZi
	 56xLjw29crvun0VBBf/Jb9RVan02duhkI/Xq3sJQdSIOUHFA/6sgWYqQ4Obqzt3biYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470572;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
	b=Y9IzwWHg5b8UeV212LveUvpTubypkmNqre3qmGAVpKA/j06aNl/LDUjyzG8WTkGQq7D3
	 ksqZjHSWZigaxdGkdTfC9JRz/8/pbxvcCvUiGPkeGG9UgX75HLEiRpjwyVfR5VxFH8yuz
	 EwpdJZEFdyaKmfDPiZXus69xKDcAGoXm8Wzu0t8/mlT8qtqCYCZocueH+b0noi34mkebA
	 a18wNHNSTr6TzNmzoGonSrbcLGUOnGeghrBPyka3uygcnMLvChfFAIgKAPVFFYq0m6IF0
	 D376OfGJOtJuuRN0xgJQh7k1TClhNOVgbE55K6KEolsTcN1+QxbtuH9p2pClFKDE/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FpiXgiwh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bCXDnQ2R;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DB1606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DB1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FpiXgiwh;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bCXDnQ2R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795470571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
	b=FpiXgiwhVU95PB3rMj1jjvmruy8+RgOUJ7QbzLEozHcFu2KXeTGVDZcPFNTZITVPS9IkR0
	jrbtSLJFJPqDK9IYonDdQKMeGt5WBjzsDW0jS0IWpwl/zQ1/0WjKJCJF+bik7C4Dr9Lq8R
	qWB6xJDn35dg1MaPil92cyaYWi/HOUU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-_oKFCPULMh6OMzfjU_cZiw-1; Mon, 23 Nov 2026 21:49:28 +0000
X-MC-Unique: _oKFCPULMh6OMzfjU_cZiw-1
X-Mimecast-MFC-AGG-ID: _oKFCPULMh6OMzfjU_cZiw_1795470568
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920f97bcad4so70811656d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795470568; x=1796075368; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
        b=bCXDnQ2Ryer5m326RspAln23rGoCEwQJTNaCAWCsv96rqxf6eaYey6KX0q789iTMCg
         Cg92nKnghbXo3L3AyI5aII6FtvN/X0pEU0jc48Fx0Ye+WTDrMCEBldLuTPmZ/51YhVfj
         VvmJkehxJ89hBkv4ZJt1bNMCaVo61f6c+86YXpf3dfNFkzzpteASf9fWCWlmuKIjM6o/
         vYTkRqeNxo/MC2KsGR6Xkj6nbwNgZs5M1+PoNjZZmW+nAHNGVytGAtdgxs5RoJLQeLDP
         o+Ag3N2s1oPGc+mQy8O6t06sfFL9LF/uoYYAzQIfprGwnH7FHh8IkRe1mFdtw9Zjrm0s
         PjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470568; x=1796075368;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXrg3FsOffaVIw+j1I0rphKMSxfBIiuUxoQNWeelH+I=;
        b=bnzIMW7xXPUNiBOSwm0hSNpEE0SWs4vNGGEb8kNWBqxhl4H8YLEuH5mboRF5haXo7z
         047C2BsBjy512WjQUsx4IAzAdAmebvxcZm6GGi0Q63XO8DuZQbmm+Kgnn51JIq57Ytj8
         Eur4Z2/RQIxTeerKp+3AiWT0UvzW+Yk3FXkO5fEATBgDOjkZ0w6Ku/dkOA4wk0Ho6kR7
         sAJyOageXY/fI6s0BhqYjHR1U5hYuIGavnBTscZnHVhrnf7smOv9mKOqjUo8Un44wQW+
         8aq7FAu351QklQtF1eLsLBjOEGNW3SufWdO4WnVGkMDh6VdWFOXIbkSmS28+oDszG0Te
         lEVw==
X-Forwarded-Encrypted: i=1; AL+hErFdpkm1I4D6Mb5VlK+DGSQzWHAOaemSqZD1bMPO8CBuIyD0c780mmbFohzpKXK3/8Hh7dc1VYngZQkb9jA=@vger.kernel.org
X-Gm-Message-State: APuU4Z88EpfzVwoFDGi9eW9NG+f14xg/m9DqfzW6KpMzfsnLBEBlndOY
	ounCqU4b2zJ3TaHlh10UDa5RSfaYEpVlHnmoxG3yOqwwGWtd/tVMroAtgNNJj4+/8CdY4Q9kZ2W
	JyHJjaNW3Aw8KrUc3u6Rw8YNTccBkLKUGA2ctYp0FjvnUT2RLItnIaQ+H+iEvi1xKyQ==
X-Gm-Gg: AZFdTZedAvOSncURHH6MqcoIAXqTrk8qH+hLXAWgZDQ/gyw1/7B27hSL0h/rQw31TLe
	HNkau2LmMz0/l9vbmUFqCn1v0FQNnuastRvv36M0bIS/zTEDtCnGe/AAAkODLiJrQJQH0zyFC7b
	9QCYf/IWvBOcjNzIzVCY0zcN/6EEZRd5sLMXK8abXIDQ2wdgd0argx3zVk0jEFDKZfvH0IL0HKN
	ieJpDNhG1jZc1aawk3Xf65dvUnhTfrfN4HJcgfM+ieIz6wSHN3tOLcgdhWLrcLUPBKZCe5gBBey
	ttZXG1RswOK2EYXgHfxs8JEWsV9AZaRV3j8DmrA4S2Z6HTTr2BFsnCftBahBqn6urctZTk2RLdj
	iDGBqPTw0Z1Zdpx9nDhuw4FkeNUY41G4h108666syl9OCDLxPMdWCHVOgbnTw21EYZcc7IrdRnF
	zqgdsRyuRhvhcOJuoTnZ4TpWgzXNyXX0tJdj9W3+L6BIBF2eP9lmb4zgakTq4aAEv0djVWlmY=
X-Received: by 2002:a05:6214:252d:b0:91e:a73b:f9cb with SMTP id 6a1803df08f44-921349d1a8fmr238824476d6.4.1795470568029;
        Mon, 23 Nov 2026 13:49:28 -0800 (PST)
X-Received: by 2002:a05:6214:252d:b0:91e:a73b:f9cb with SMTP id 6a1803df08f44-921349d1a8fmr238823796d6.4.1795470567440;
        Mon, 23 Nov 2026 13:49:27 -0800 (PST)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm117366396d6.21.2026.11.23.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:49:23 -0800 (PST)
Message-ID: <7eb28c6334a655eb5bfbf3035cf1f1ff1041bb3e.camel@redhat.com>
Subject: Re: [REGRESSION] DMAR fault by Intel H97 SATA controller since
 "block: Increase BLK_DEF_MAX_SECTORS_CAP" (6.17-rc1)
From: Laurence Oberman <loberman@redhat.com>
To: Niklas Cassel <cassel@kernel.org>, Tobias Laas <tobias.laas@posteo.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	regressions@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-ide@vger.kernel.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org,  David Woodhouse <dwmw2@infradead.org>, Lu
 Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Will
 Deacon <will@kernel.org>
Date: Mon, 23 Nov 2026 16:49:07 -0500
In-Reply-To: <awSs5Cw3hFkf4O4T@ryzen>
References: <5ad27a97aafbc08a8702d5b90d09cd59@posteo.de>
	 <awSs5Cw3hFkf4O4T@ryzen>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-23 at 22:15 +0100, Niklas Cassel wrote:
> Hello Tobias,
>=20
> On Mon, Nov 23, 2026 at 06:51:03PM +0000, Tobias Laas wrote:
> > One way forward could be to a new entry to __ata_dev_max_sec_quirks
> > similarly to the recent commit
> > a12cc63129380a5364e787d92b30a3257f66c250
> > ("ata: libata-core: Add max sector quirk to INTEL SSDSCKKB240G8").
> > However,
> > I wonder, whether that would fix the underlying issue or rather be
> > a
> > workaround, because 4088 does not fit the pattern of all other
> > entries,
> > which specify either a power of 2 or a power of 2 minus 1.
>=20
> Your attached kernel log shows that you have a
> Samsung SSD 860 PRO 1TB, FW: RVM02B6Q
>=20
> This SSD is probably quite common, so I somewhat doubt that it is the
> SSD that is at fault here.
>=20
>=20
> >=20
> > Furthermore, the first error messages are DMAR faults, and a SATA
> > SSD that
> > isn't functioning properly shouldn't cause any DMAR faults, because
> > the SATA
> > controller should never read from or write to areas outside its
> > memory
> > region.
> > Since the issue with mounting the rootfs disappears with
> > intel_iommu=3Doff, I
> > wonder, whether there is a limitation on the maxmium block size
> > either by
> > the hardware or from the configuration of the IOMMU and SATA
> > controller by
> > the kernel.
>=20
> Considering how common your SSD is, my guess is that it is somehow an
> IOMMU or a BIOS/ACPI bug (since the BIOS generates specific ACPI
> tables -
> DMAR on Intel).
>=20
>=20
> We have seen similar reports here:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220693
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221713
>=20
> Does it work if you revert:
> d373449d8e97 ("iommu/vt-d: Use the generic iommu page table") ?
>=20
>=20
> It would be nice if we could involve some Intel IOMMU experts.
>=20
> If the ACPI DMAR is at fault, perhaps it is possible for the kernel
> to
> patch the ACPI DMAR for your platform.
>=20
>=20
> Kind regards,
> Niklas
Hi Niklas, Tobias,

I tried to help here but (full transparency) I had some LLM help for
further ideas after I coul dnot repriduce this on my platform.

I tried to reproduce this on a Coffee Lake desktop (i7-8700, Cannon
Lake PCH AHCI 00:17.0) whose INCLUDE_ALL DRHD reports the same
relevant capabilities as Tobias's dmar1:

  dmar1: cap d2008c40660462 ecap f050da
  (SLLPS =3D 2M|1G, ecap.C =3D 0, MGAW 39, SAGAW 4-level only)

with intel_iommu=3Don, DMA-FQ default domain, max_sectors_kb =3D 4096.

- 6.12-based kernel (pre d373449d8e97, i.e. the old VT-d page table
  code, with the larger BLK_DEF_MAX_SECTORS_CAP): 2M O_DIRECT reads,
  clean.
- 7.4.0-rc1 (generic iommu page table): 2M and 4M O_DIRECT reads and
  2M writes from hugepage-backed buffers against a SATA SSD, ~15k
  I/Os, no DMAR or ATA errors. The iommu:map tracepoint shows
  2 MiB-aligned iova/paddr mappings, and domain_translation_struct
  shows 2 MiB leaf PDEs (e.g. 0x000000039c200082, PS set), so the
  superpage path was exercised.

The 4088 vs 4089 threshold matches exactly the point where a request
first needs a full 512-page (2 MiB) IOVA, which is where superpage
mappings become possible. All three of Tobias's fault addresses fall
in the same 2 MiB window at 0xff400000.

So on this hardware neither the old nor the generic page table code
shows the problem, which supports Niklas's suspicion of something
platform specific. One difference: on Tobias's system dmar0 reports
no superpage support (cap c0000020660462) while dmar1 does; on mine
both do.

Tobias, a few things that would maybe help narrow it down:

  1. Boot with intel_iommu=3Don,sp_off and an unmodified cap. If the
     faults go away, superpages are involved.
=20
  2. The full dmesg from a failing boot, including the DMAR/DRHD
     lines. The faults are reported as DMA Write while the outstanding
     commands were WRITE FPDMA QUEUED, and I'd like to see what else
     was in flight.

Regards,
Laurence

