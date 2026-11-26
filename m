Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653217;
	b=LKqg57TTlsxSnmSxA67KKabRHNdNR87MWDpXOeQH6J45/zGsFZ2I/6FP695VJjsN/DxA
	 0C0LoxYSxt6ITY4mxq3VBgUNfdUr44NcGtV4zdIlhem0teno+EJfW4h6LBRiYiw11LgOu
	 Y76ytLMKUNJPp5pFA7oXvgPJJAk7hzem9lQ6R6DGGhj2TM07Ao6PkZp7TTrdza3H1mcu8
	 SPQYwxb7AmG81NSIwO/3bA2OAAXGmJdio8ybI0DVlLOol4VBO3DjUwgOMWtpa30c1Qxz0
	 wzuWvh63ccQy0/CMIPsZAvsKFTvjxDfpHjagxppip5bZmOOAZktheeqG9rzRNika4Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=n7CSRRc6wmlgTahpgsaeBRSOFvVKDVf8gI4nOytFKB4=;
	b=ZXcTTUOBnT08FhA493ClqskCLfxQHsTmCyMofX1cy853d3oxhcnkx4bl9CNX5bYFHgRL
	 3Rs1nTBQeWytDwQDowVP/sX8RkdLFCaftjr68pYWPPGnuQwTPGwkl7CaXC561pkH67wqj
	 YOFtm1+4Z8DPNySLB6Bh4Q/cuCcniEtmesegk++BbIIeKoLbEdOB3OM4amnao9s+sEGPt
	 U2f8U/x93CXXMJ4LzZ29HdC/EmK3aCrGmJrXKi9btoNHEFfER/u7WJ9pR1VCTaCXQBSdD
	 NqqC8g39ERY8HaIpJdkRnVp3HunYde8fgvz2r4l+zDwRRL1ZrYy8OxQVavHvKiK5dzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWsCuCyo;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E6E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWsCuCyo
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f06ff94acfso28200635ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795653216; x=1796258016; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n7CSRRc6wmlgTahpgsaeBRSOFvVKDVf8gI4nOytFKB4=;
        b=jWsCuCyowIb2n9Rv7XdeLBoSHT+n7g0YGWhHrYh/G0RdYbTbF+56gGVgtVisdc7T89
         MKawGtG9pHO6Ft+ybk3kmMsiPH+MQDGsejbWohGWmgG8aVaZe7iIhfp6RsC/JOpFiaON
         MO0rbPj305k5dwkqPK3ddivXEQMTBWTTiu/DbNXI4wP+pZo0lH2TNoTTSF/7iFb+fmBz
         uaEItEXoD1gh+4J4eUm9FIUIMZh/n3it6jjwxxUyGY7v5bohC0TRCdpjc1kI90Gv0toj
         q2JHXP9sgeZkxyJDuT5shgUMemp7awDDz3sc8WrT2PFHVCGJZbhYRSPXy2dq7T3bZ8rR
         r1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653216; x=1796258016;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n7CSRRc6wmlgTahpgsaeBRSOFvVKDVf8gI4nOytFKB4=;
        b=Fjwpml20VD5lELJ+/3zGQSj8UIuh8kwFmjdXQjim7R2LhcIJOl4kzUdYfF/Fh5NgAh
         ZXOvDXfjjcyd0138VZJ6eM2AxYwI6ZiyXu9H8YvyUUsrHq5lAHcygdJN1/Yh2VZAzhvJ
         p6+9nTwwRyYn0MraBtVQsMytE//ERw90I+V05sCnZE5w1EVmXigN7iGFyuXjGcD5gOMa
         Tjb/UPgqHhL/dhEBE8OXCv/Fod5QciVSo+EEhXS4eIwTVFupWPe76PAWVbjE1o7PriYq
         qRBVhbg/CQ3+3vQZ7o0EtPvmEqS5xCtDvUKSsE1Imr+1SNs4QOuulyYNazkJ1rw79uAq
         mDfQ==
X-Forwarded-Encrypted: i=1; AL+hErERNbQHkS0lTP3hYF2BVCAgnnMyDZTV/085AvrNUK5mPMrGaiYXxztoFxhsR760sbZRPmxn9bR5AQ4eBJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SiBuHcV4G9Ck77Bbffk/0n2GRupQpjZWgNMsjVvlTcq3tiaKv
	Fp5JH4IVSKsoUpApuaOeu4XbLnEiqc7PzxHOk/w6k25A8+h6LzqggAVGWTWY9+Aapw==
X-Gm-Gg: AZFdTZfXpt0LpknbWOhF+2BBmwVuXz9K65jOHytoZC7eRJ8/2Z7FEPfEdIw3MHA2znT
	RYU8uQVpDQkI0+riuMwGGHTzIoJdLw/dVcUnTJXEcpNBzoIgSMIRNTf3fLDu9256Vcum7VYFMel
	38OLUAuGTgGlhaGWzQUilDdevw3cT0CD3KQrzI0NhSVUtScSbF8sOogP2Kqv56bAqJsTgE/VVsO
	lZLAARNzXEI3i3oYP3WiWjx0WEydKGCoIvkl/2JoccHy9FjXoXBXZEJs75JR2JsY/J+vGBoQ19E
	jMgZdgHeAYb9M8SGO54HVY/t4QIlbOy03F6vShOLMCjoFhLumeDaWMpti11Azf0x0xK4xQ196JJ
	SeW71Zmlk2av7eJxUCT6q3Z/6JbXFSTyNTfXGviFiew3aXpYs0MvCSA4OsmOC/jm1/Dcd7iCreq
	RQDmdXd1eX+pZH92ym58OXrLd52k4wO30B2VsZ1UHFR2oM2VqfROuT/mYUwBzRMOk+pq6I7F0jS
	vzYUn4almQMm11QPqQFtfkD7pj/WlaPJtPJhnAJNB6XwQrH6LTtIlxH3AGJ0FXEwrY41pfrBlwE
	fNC02GEYglK+pJKwrPsxsTPzFVMCciU8OJnydhNv82M/Xw9vpJbWyNiRN5jJW59G
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr192264515ad.15.1795653215229;
        Wed, 25 Nov 2026 16:33:35 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm95165955ad.75.2026.11.25.16.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 16:33:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 16:33:32 -0800
Message-Id: <DN4PXTY768YS.3I99BQYLC8VXI@google.com>
Cc: "Mostafa Saleh" <smostafa@google.com>, "Daniel Mentz"
 <danielmentz@google.com>, "Samiullah Khawaja" <skhawaja@google.com>,
 <iommu@lists.linux.dev>, <kvm@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Logan
 Odell" <loganodell@google.com>, <linux-fsdevel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 7/7] vfio/selftests: Add observability test for IO
 page table usage
From: "David Matlack" <dmatlack@google.com>
To: "Pranjal Shrivastava" <praan@google.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy"
 <robin.murphy@arm.com>, "Jason Gunthorpe" <jgg@ziepe.ca>, "Kevin Tian"
 <kevin.tian@intel.com>, "Alex Williamson" <alex@shazbot.org>, "David
 Matlack" <dmatlack@google.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>
X-Mailer: aerc 0.21.0
References: <20261001224531.765278-1-praan@google.com>
 <20261001224531.765278-8-praan@google.com>
In-Reply-To: <20261001224531.765278-8-praan@google.com>

On Thu Oct 1, 2026 at 3:45 PM PDT, Pranjal Shrivastava wrote:
> Add a new selftest, vfio_nr_pages_test, to validate the iommu-nr-pages
> fdinfo metric across all IOMMU backends (Type 1 and IOMMUFD native/compat=
).

What's the status of this series? Should we expect another version
(e.g. after the discussion on the shrinker RFC and at LPC)?

nit: Please use "vfio: selftests:" as the shortlog prefix for VFIO
selftests (see Documentation/driver-api/vfio-selftests.rst).

I gave this a try in QEMU with an emulated Intel IOMMU (which uses
generic_pt, so it reports iommu-nr-pages), on top of this series. It
fails in every mode except iommufd, which skips. Details below.

[...]

> +static long read_nr_pages(struct iommu *iommu)
> +{
> +	char path[256];
> +	char line[128];
> +	FILE *f;
> +	long val =3D -1;
> +	int fd =3D iommu->container_fd !=3D -1 ? iommu->container_fd : iommu->i=
ommufd;

In iommufd mode container_fd is 0, not -1, so this reads the fdinfo for
stdin, never finds the key, and the test skips with "iommu-nr-pages not
reported by this IOMMU". libvfio uses a non-zero iommufd to mean
iommufd mode, so:

	int fd =3D iommu->iommufd ? iommu->iommufd : iommu->container_fd;

Also, consider moving this into the VFIO selftests library (lib/iommu.c
and libvfio/iommu.h), e.g. as iommu_nr_pages(), so other tests can use
it and the library can hide which fd to read.

[...]

> +FIXTURE_SETUP(vfio_nr_pages_test)
> +{
> +	self->iommu =3D iommu_init(variant->iommu_mode);
> +	if (!self->iommu)
> +		SKIP(return, "IOMMU mode %s not supported", variant->iommu_mode);
> +
> +	self->device =3D vfio_pci_device_init(device_bdf, self->iommu);
> +	if (!self->device) {
> +		iommu_cleanup(self->iommu);
> +		SKIP(return, "Failed to initialize VFIO device");
> +	}
> +}

iommu_init() and vfio_pci_device_init() assert on failure and never
return NULL, so these checks (and the matching ones in the teardown) can
be dropped. Please follow the setup in the other VFIO selftests, e.g.
vfio_dma_mapping_test.c.

[...]

> +	if (!self->iommu || !self->device)
> +		SKIP(return, "Fixture setup failed");

This can be dropped too. On top of the above, the harness doesn't run
the test body at all if FIXTURE_SETUP() skips or fails.

[...]

> +	/* Map a page at start */
> +	region1.size =3D SZ_4K;
> +	region1.vaddr =3D mmap_reserve(region1.size, region1.size, 0);
> +	ASSERT_NE(MAP_FAILED, region1.vaddr);
> +	region1.iova =3D 0x100000;
> +	iommu_map(self->iommu, &region1);

mmap_reserve() returns a PROT_NONE reservation (it's meant for reserving
aligned virtual address space, e.g. for mapping BARs), so there's
nothing for VFIO or iommufd to pin, and iommu_map() fails with -EFAULT:

  #  RUN           vfio_nr_pages_test.vfio_type1_iommu.sparse_mapping_stick=
y_reclamation ...
  # .../libvfio/iommu.h:42: Assertion Failure
  #   Expression: __iommu_map(iommu, region) =3D=3D 0
  #   Observed: 0xfffffffffffffff2 =3D=3D 0
  #   [errno: 14 - Bad address]

Please mmap() real anonymous memory instead (PROT_READ | PROT_WRITE,
MAP_PRIVATE | MAP_ANONYMOUS). With that and the fd fix above, the test
passes in all 5 modes.

Also, please allocate the IOVAs with iova_allocator rather than
hardcoding them, so the test doesn't trip over reserved IOVA ranges on
other platforms. e.g. allocate SZ_2G and use the start and start +
SZ_1G.

[...]

> +	nr_pages_final =3D read_nr_pages(self->iommu);
> +
> +	/* Page tables should remain allocated */
> +	ASSERT_EQ(nr_pages_final, nr_pages_mapped);

This asserts the behavior that the cover letter describes as the
problem, and that the IO page table shrinker (or the clean(gap) approach
Jason suggested on that thread) is meant to change. The test will break
as soon as empty tables get freed.

I think it would be more useful to check that the accounting tracks the
page table in both directions. e.g. also map and unmap a range that
covers an entire table with a single unmap, which generic_pt frees
today, and check that iommu-nr-pages goes back down. For the sparse
case, ASSERT_GE(nr_pages_final, nr_pages_initial) would still catch
underflow without depending on when tables get freed.
