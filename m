Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446691;
	b=B1iYITwX058Rro8nTTnCPUZH76bYWknEFcYjM3lmFMfmu1VYswJzmSR7EjCsCWSX+BQP
	 YXAttixuXe/i4urMoYuZOtybiJJ62511nexiWp1KMtN5ZWdIdD2OugofnWkBshG/EYlqw
	 fIvYfH6+PQ6IpOWl4P8dX48TWUlOzlv4FguQGitaOuDD5NCtt/XcX6eUKGF3HHL0763Ly
	 Lf62S+FIwIsuQC8F+FFedFWQBQJ1rNHksl1IuUHmIUiw4qpQDAaEnvFH0Vj5wQ4CiYUuA
	 TEHKEeMOE/nqc299NdAKN3R30d6MvWOHiVSmiIryCJ2cT7CTHaYLmmLul5Kcvp2sP/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
	b=vHXIv/IX7lX6jFL1KepHrQZeygrv2yVJjadU8IyHmgwvftJ0aOojzYSg2jsN4Y/ZqUJt
	 awlrkZHAb4eHZx48ZaWPWt0CcU8fejFPbb3WBzEKVfodDuFoTdZ/YYLOQ6TrZMU5I1vfb
	 IMcoRZAJRzQizSGYmBnTbo1we/Dhs8NL3fz+MRVDPQitlh0IwQkpE4OTM0Cmma08fFe2L
	 PLyMCCUxgp89p00WZ7HgWc7RU0UYRc6NZHhnGvkXGvzgmmb4W8ksI3p7gzNziMWU3n4SR
	 Mo4T5OKA8h1J2J07HTrBYEvOJJcI3NFrC/mbJ1RlUO2/SDdE+HGrvqjPhIUsuUxmT6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ULnOCYsQ;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A63606A684
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A63606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ULnOCYsQ
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-92104b67a9aso34579206d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795446690; x=1796051490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
        b=ULnOCYsQhWIKDt7pAFJxN5BdezB6uuwO2wH7M3H75HnvcnHu0ePPTzZKt+/E8HJbsq
         8xNQcunddG9jd5Lyy5gXDUoI6tNcqkgliwQBuS09bcwR4F/99g5XmNioCqy1g81xleyk
         LHhAxO/sQfFLnE4JLEDu/YBjhGAidQN37cDWd2dzzVWGUITLsdgtKfpXw8jO/nNEuElh
         tyEhFp/7OKJTeRItfxiGqKUkSnpdV0wQ/c4bCV2HFB7OEb8h0vw3dWK2Ty+VuV9E6Ewn
         yDkmNQkEnylRuyYGR1sqGLaQPOKxcWwfhEHqIAlHska+tD6+MsFsnDzdHU0merc4Sqat
         NOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446690; x=1796051490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
        b=lDCUu3GTgbap5BzdgZeUVS+jt2SXyAHv/tVh2eFQR6GidMW0e+KtwzYXx9ovNf9unJ
         fR1EPcoOyVqbOd5SPus6m2neit+8dz2UU4ms3RXROWTSrCyNW0N6ASea0MJwe2Fh8zFW
         FFb39vao5DuBUmA33Kg+q0U3WxEnxy6Q5YF8g13acxcbraAAYB96gcjJywphG/F8vDkp
         969e9GQKiLrE0BKPhacXThxs6/9i8+3n6HuGvXUiYJ9+beUOY4/j1rDBLfQmjUZw0MTb
         TPlxHrAi0gE0nkexD8oLQbgGP/p0aQp4QWraqMrc5Hw4KQqvTktYewB/p2gvTBW8umto
         ThQw==
X-Forwarded-Encrypted: i=1; AL+hErGf3fo6+uaPpcxuuKJXfEAnL/PbXTabgry0kRvQ5J9Svs/oKswQDJK1aAeOPVt2RDdhJn+OvIR9LvRacpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ccmPPLOv1cInlpHIX0WyiFijAyGiFm1K0hcgm3A7axo9hYUnp
	YVOt/3gGwf4kuJ8ZDaeqpP+yqiAUnZdeSlL5MS2Nptb6mD4dWqrIJB7beYVYuRCa+Hw=
X-Gm-Gg: AZFdTZc5Txkh3kfanGVDSG9BHsXsZlaQo/jdZJYtFM0u5CgjDHkiE8iUctG4V/1JX4r
	68lOlWP4jWk9xLuC7qw1yrH+1h10zJ4KYOsNNi+CFD7h/F3oYYovdqVVOVWPo+c/uq1CU1uKgbo
	DDcpCxfFCr2K4cpLAHoy/tc9qsFL7frgIzwsq8CY08uSNRmc0tMR3fPKSzrw6sVsMMPt+epdhb6
	38uRHiDoBzuVgxG5gqFvHsewcrIHWIY7Z1K+nQQ54SYcJy7Whdl7xFfFyIfZtdqV8kBK2a3q63f
	QFnzWNt311roM4eofDhWtuY+Dh/5kYz7nsXhnZtbTV7xm9dTeazqk2RL0RuHwtosFWi010izl6c
	MwfGdLMoYdlcQr4P+dt+WfdBU+9fA5GC5yLul2efsKP7PT9h9603NZhIggSgSvk1ohbgatvVrF3
	VnlmYAeyO6not6n73NQHXUdHudtn0ovZeQdSV2UzX7wMjIdTN2nz6VzgMognCPcexrLqNzV+rUH
	0TkSRg4sG7XZ8lxbly8YLXzi9JZDWU+rTfKz45sbvxaTrNqiOsQVEAirAlntkdFwq5saHtgDv5L
	OBOGgjuBL09vOV4/LyQA4Dx1GnHsisdIFTbxuj85Dm8bzMJ4N2b3fICnQ726Icdsslv8ijgGQbK
	iP3E=
X-Received: by 2002:a05:6214:4108:b0:921:266f:50ff with SMTP id 6a1803df08f44-92134b3f207mr208575596d6.52.1795446689538;
        Mon, 23 Nov 2026 07:11:29 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b50besm106533186d6.9.2026.11.23.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:11:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVhY-00000000ro7-1hOk;
	Mon, 23 Nov 2026 11:11:28 -0400
Date: Mon, 23 Nov 2026 11:11:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@resnulli.us>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	zohar@linux.ibm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com,
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <20261123151128.GD179082@ziepe.ca>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
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
In-Reply-To: <awQz1P6iXYrL8lv0@kernel.org>

On Mon, Nov 23, 2026 at 02:38:44PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 23, 2026 at 09:09:02AM +0000, Yeoreum Yun wrote:
> > Hi Jiri,
> > 
> > [...]
> > 
> > > +static void __iomem *tdx_attestation_log_map(size_t *length)
> > > +{
> > > +	struct acpi_table_header *header;
> > > +	struct acpi_table_ccel *ccel;
> > > +	void __iomem *log = NULL;
> > > +
> > > +	if (ACPI_FAILURE(acpi_get_table(ACPI_SIG_CCEL, 0, &header)))
> > > +		return NULL;
> > > +	ccel = container_of(header, struct acpi_table_ccel, header);
> > > +	if (header->length >= sizeof(*ccel) && ccel->log_area_start_address &&
> > > +	    ccel->log_area_minimum_length &&
> > > +	    ccel->log_area_minimum_length <= UINT_MAX)
> > > +		log = acpi_os_map_iomem(ccel->log_area_start_address,
> > > +					ccel->log_area_minimum_length);
> > > +	if (log)
> > > +		*length = ccel->log_area_minimum_length;
> > > +	acpi_put_table(header);
> > > +	return log;
> > > +}
> > > +
> > 
> > I think we don't need to dump log area with the log_area_minimum_length
> > since the area would include none-event otherwise, pre-exist tool (i.e.
> > tpm2_eventlog) reports error for them like:
> > 
> >   ...
> >   - EventNum: 21
> >     PCRIndex: 2
> >     EventType: EV_EFI_ACTION
> >     DigestCount: 1
> >     Digests:
> >     - AlgorithmId: sha256
> >       Digest: "b54f7542cbd872a81a9d9dea839b2b8d747c7ebd5ea6615c40f42f44a6dbeba0"
> >     EventSize: 40
> >     Event: |-
> >       Exit Boot Services Returned with Success
> >   ERROR: corrupted log, insufficient size for event header: 3
> >   ERROR: failed to parse tpm2 eventlog
> >   ERROR: Unable to run tpm2_eventlog
> > 
> > 
> > So, what about export *real size* of eventlog like
> > tpm2_calc_event_log_size()?
> 
> Nothing in the patch (neither commit message nor any comment in code)
> says that TDX attestion registers share the same format as TPM2 even
> log.

It comes from the UEFI spec's definition of CCEL:

 38.1 Virtual Platform CC Event Log

 If a virtual firmware with confidential computing (CC) capability
 supports measurement and an event is created, virtual firmware should
 report the event log with the same data structure in TCG Platform
 Firmware Profile (PFP) specification with
 EFI_TCG2_EVENT_LOG_FORMAT_TCG_2 format. The index created by the
 virtual firmware in the event log should be the index for the
 confidential computing (CC) measurement register. It is CC vendor
 specific.

It makes sense that the kernel would size it correctly.

> As per the function, perhaps tpm2_calc_event_log_size() should be
> relocated to lib and have non-TPM name like firmware_event_log_size()
> or something.

Probably under drivers/attestation since that is where all the TCG
formatted logs should end up. It should be 'tcg_event_log_size()' or
something. Maybe a tiny module for it like we would have done in lib/

Jason
