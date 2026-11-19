Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105427;
	b=I3lr4YIehvj7gSpIFXr4tsnZ7MtAeeQwujWcbtkROOmXtDQdnF48tWZvhDqWv9i+Edi7
	 X6Qe9yHl+KLAYSrOzKLY3riGUOjFvfjNb5I3RbQhUrLsBoLXXsIy1njFg9E7xLzP2lIUH
	 UL21SAvQC8iSEMDio/8gBj0dEhq4YQGC4wnLMpUh4Fsg30yXdNdqyFWXaotPbDwa8UpEZ
	 deBDmDyJTTgFikpzc3ROnzhbCrTuEdKqz8T8eVBdCiBQtzYy/kICVsFYRYGV6INFPLpgf
	 QfO74yzCDx8kJF6g7TF1vA2Y5tDtsExEBVk+qV64ih8EhjjyL+I0sYYFCMPilV76N7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
	b=QdV3kfkpjIn1heEb2TgM2dr9da4MYtyU0QRbz81Fb09v2Pyabs+TqcBnVufIv4bZoxFf
	 fNJtSfKDhRtYpufjJXCRbNfFjk6abSaq9eKCdwxXsUTOf8WlG9ZBNk6DOik7jHFW+iDyV
	 ESsjbCoYKEBs2xRew+pefz2U3NjJ4tG+sq6WhOdIMUuYEaFtgUnU73PErnDsq3txAbrrN
	 ncrFdWSpQKAnagDLddEPMEk4KfC/HwIK963NaTvcyyaEWmvQ0/fjfAilshtbIi1GWHNNF
	 ZXYkrcGu/MIu3iZVEOGvXKsI0xnEeNKeHWXAGE93PPv0mEReZSwIBUSeld3BSuNThoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NtKSe4Y/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C7606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17C7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NtKSe4Y/
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso858142f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:23:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795105424; cv=none;
        d=google.com; s=arc-20260327;
        b=Ftlv7DYFB8SoHPKCZU9jaAMK4vQ6ys/NIo3km91LUehUPfBiTSm7RRVp73wzeBYYww
         w9NqJXb2c5McI8WpCHai/NqZuTvnp4e6697+1uTil+KhMJzhC6fuJdfh6uIDMsiB10/O
         WZXGN4mN1SjrgeLoatC8qjTrZMROoDiQqYBV5+k6pRxNJGnaoR0EheWshP6EuKqj+bkD
         zrh3Qu7/aFNV27M+iIT49+BC1+PvWWD+XwciSc/Qj1Ny2vI9o579/8jCdWMZGNs834AH
         N5L+/Sa7MgPImySs7HxtVsKHBe2/BNoJYE4eVAz+dwj9yufQhrC35esqLG5saVbw+HGP
         v4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
        fh=8Hr7XRKAwXICK7MGQY317zbMf/35mNiYE0Jr5hYjX64=;
        b=Vq7xderL/xlrx6iH9qZdGInQ0ADCOgb249ZHTZdc7MeThKYgCyS9nCbO+z/oQynRjb
         MjUG11ZLLP4aolvsBeDo1yvwlURn6XsdeR/logTqWY7qv0INU31KFaZVklFQwHCl5lC1
         Us207MhdpG4OAoiFP2F9KlQ8niSdo7+ieLVNQUgbbR8Su4Ey+osE+slWlIrRizxriGdk
         V3kQNWVeQnZ6heSbl08Hu6T7q+uQSQKDG3e3rcRGo7BLBk7Yzof3pfw+NFBcZkGys++j
         gMQkrRoQ6Tp3noaw4DDNlA+UXBQa6Fn0Z696ZYPGDz07qHCENaNtk+H+fKZGxWe3Ny71
         I0hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795105424; x=1795710224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
        b=NtKSe4Y/hnOj0P0R1tYVUUitJCFSZHniX+6wzTl8PcZgRDH+nE1P7QrOm7MCun/sbZ
         zyKEeoTVIGC19JVAG7I0xGf6gHcIjbNo2eJuV10cIqv+WfDDuiHSM4TQ1y0tDWQNfXyV
         EYoP+PaXg4O9vVwij367syue8BDXdnsEf9gJprgryAV53+rBV2CSmjdQPgLeTDquxzY7
         e6iN8YmYqH2GnesvCtgoOcXZ1Y/7fB+lA/7PNvly2Dw9K1jJcsrit7Sc9tp7waT54w+g
         oavT/E/QERscgadunlxUj3WmA0ahiEqCGYHaT70lP2ofzZmXy5S1QiB8ncdi86FN/ldr
         HDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795105424; x=1795710224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PcaAwQ0PR5vU4PI0WrkTjiNqMUtnDUUt58Dd2LFEBo=;
        b=QBBb9LGLjDbAUtwVDj4jCIRrobfdS519xOCU/Yv3PZozY0d3/A97xFwbPucSWmft39
         lynrmE0v7iq5hOR2aRDbVkSLKADPjmpwu7dEfuOwADIDJKqBV3iMuvE6eER3ShStESot
         EMG4YCPZIqsotekudWoSLyWkHi2r/+BhxniFwmkr5+fXOEp6fpJvrB2yahRhSupXwnVb
         ETcM1qMu8vRga4Za71Jvrhn5vyVNdw/2QZipFZcEACCPM3czuUB8koqWFYxOPowrgYlT
         Hhm+VmJGty6Yh7Bri+1Q1FqoH11WexSyVPC39PTEkYeWD3Zv9ku9Jf8dNkfs5zBZ7zRg
         vC5Q==
X-Forwarded-Encrypted: i=1; AL+hErEZPHmEnJcKp1pff5WfCfgy5ZKEluSb8ZLudDfQQEt8QloKG4GXXIH1PRD6LhCck4me+Y5HTs6GqDXJmbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UcJ+edG+X1Kiz3h7gjSRwwO7ZNEr8F3Vwhf9W/s09O9EVUVhW
	dXgCFt4Rh8TwP1jzgK41erRQJzK4auBP/QYG4rFXPoecmu17VBnzwHJc7qrVvOp8+3rSr4qdwHW
	xQTd6xivArlRc39a4yAxTULMl2aKlYFnVM40cSqjB
X-Gm-Gg: AZFdTZe0kQEACXGB7a6Wb8eLLXo0uKJjGCAIE0EzBo4FN8Djj1wX4ywPU7jx9TaR/Qu
	fxm5qsVOvfdVrpJI+JujNWNslo2jiuz4lMeB8DTSzYxKs98waty3TUjnRq8ZPK5dP14G5VtniXb
	X1AIn0ZkEUt1WpdOrRpB6SGcgfihZes6B3cHsG07UZzAc6bMIsfGyvc9JbvAc7tIkd9Z/9Cb5zL
	WUtaV70EZRA9dRgEjG4b7l+8J/r31DOdSMp8bdL1Ca2WHXp7QhPp7rGojv7fo0ttXisYl9M02eE
	/P8mLIJq95vE5RDQRdxYLyHTroREmyuLDqgwSlS4cu59hLpxpWLJ4Jh82Cbn9jWK/CdGXQZTBH5
	d7JJ1i7HhXMLAOadLZrFNYXt7TnhX5lu1NEUBuKwLpcfp/9FZ753ebm38IxC1hQcjm2jOejewcs
	mEARZS0cdbs0ZW0nsBU9+MgjH1RPjLvpdQo6qLW7KIcSCM
X-Received: by 2002:a05:6000:401f:b0:48e:7475:fe7b with SMTP id
 ffacd0b85a97d-4aa545e305fmr3959097f8f.6.1795105414756; Thu, 19 Nov 2026
 08:23:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com> <20261117-tyr-remap-2mb-v1-2-2a8efd4c8180@google.com>
In-Reply-To: <20261117-tyr-remap-2mb-v1-2-2a8efd4c8180@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 17:23:22 +0100
X-Gm-Features: Aa3M54q16wzTGtbS81z0CLg8Zo7Ll8Oq1HQJT0nxCo6CHGOwHrlaM2Dzo0-8z18
Message-ID: <CAH5fLgjwOypVwBGaac100KiyCCwb+SqQU6Fz=CO98tJCd3zG4w@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: iommu: pgtable: add iova_to_phys
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 8:32=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Sami Tolvanen <samitolvanen@google.com>
>
> Tyr's VM_BIND remap path rebuilds the page-table mappings that a partial
> unmap sweeps away, recovering their backing from the still-present
> entries. Add IoPageTable::iova_to_phys(), which returns the physical
> address that an iova maps to.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [aliceryhl: split into separate gpuvm and iommu commits]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Joerg, Will, any objections to merging this through drm-rust-next?
