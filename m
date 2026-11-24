Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513595;
	b=xVrfcWVhKAqpTzTDwPS4D0EaxgkhdkGvJZ+6aucctdG10HDAcMbdBvAVTz9kGn/dswaW
	 lyXfnoXPov6UzfHuvXGZG9dSFMGQbktw8IxXn9+BdtlOI1ymQeHFfBRGQjVKfwqaKjxWx
	 N3RQE4T3nYZtjH7q/vEb/mjqKup1Rh29O5HBip00jF6XyFRBwQ54bxN2ycN9x+nWpgtcU
	 Y3gNrTNu9tmpwHUqLKBAG/Ygcpv98OBrhxDJszM5fgrkh4OVbj1sQYlV/ft4PctUAGvBN
	 yi92orlXH80QN/WgMyz4wA1HQTMbOI4fwwwsC5IgqWGl9bVht/CG3Lya5ioojaOBZrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513595;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w5fGPA+H9bFCghY7g2x7TUhvKF0aDCRRu8sPx7t4g8Q=;
	b=QAnbWFw95sNBk2TlbXpZcqIIOLT34eIsJodqvPLxEfyg8M1LxuTXtAJxMb2rel6DEpot
	 0lLsUdGBy+4R8ozyxW24cuiczd6iGsrFzKz3EuWlhyKy/HMNUQGCgwZYhbutTi+xPz6WR
	 c/y3zISyMwP5fkA3xYNYgd+uTGe5epWZmdt0doe8DgUmIxvMLDBJq6QIDkOKNx3zxAWdN
	 AJ+UzeyyEfimSTJKGfpPbTh1bBCuOMtXpAp2MlCzkpvGueYG+OI5MY++3ese/wcrgISv9
	 DgctCcLGQBfLr1xKFf9AVfPNq931/Mzy2OI61QFcAMsNqFMkYFt+k+SSsCLNejiW4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=QBaNuUjr;
	arc=none smtp.remote-ip=95.215.58.35
Received: from mta1.migadu.com (out-35.mta1.migadu.com [95.215.58.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6935606A872
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6935606A872
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=QBaNuUjr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LF0q2K3tyOr7KGO2AG5QfLveDcN/YDA1xdf/RlJ8cxA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795513591; v=1; x=1796118391;
 b=QBaNuUjrN00/f1KL/+KWfk19c5L/bXSiL9C4GgTli0lOF+RGEzhz61MLf9QlmCkPA2BYxYJR
 Bh6BJ8tenWOmLFwvKJxQHIwovtVudt9/KzhkjgSxzrqC7k8q61KQvnSLWmRmIqBF6zSzeEPj32i
 cyBEqq1DQuzyJagDfo2vT/r+bsGgRRhXIL3nr7NkbXyfh8s3cOd324b4yN3jod5EG/+/BcKBhKW
 xW756XkOCWNTqEnoCNpxd7ezpzu7CDxSX0oWGOuuqku/IOcLvjp2OWiNkiTqj1fOYW/Zv8e4yv4
 f1E7iQGvwtSCpD82mJ6JGyHyp2DMNx2jOLCE3dkNdimgQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 45a6dc87a3d4f534;
	Tue, 24 Nov 2026 09:46:31 +0000
X-Mizu-Trace-ID: 45a6dc87a3d4f534
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 17:46:25 +0800
From: Weijie Yuan <wy@wyuan.org>
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thomas Huth <thuth@redhat.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/amd/display: document two members of dc.h
Message-ID: <awVc8RAMO75SFkxV@wyuan.org>
References: <20261123122226.4101191-1-takano32@gmail.com>
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
In-Reply-To: <20261123122226.4101191-1-takano32@gmail.com>

On Mon, Nov 23, 2026 at 12:22:24PM +0000, TAKANO Mitsuhiro wrote:
> Two undocumented members in dc.h, both reported by kernel-doc: the union in
> dc_probe_status has no description of its own, and the comment of
> mpc_color_caps does not mention max_gamut_remap_coeff.  Both patches only
> add comment text, so no build was run.
> 
> The diff is unchanged from the previous posting.  As Weijie Yuan suggested,
> the AI disclosure moved out of the commit message: it is now below the ---
> in each patch, and it is also in this cover letter.

Tested on my local machine, the warnings disappear.

Tested-by: Weijie Yuan <wy@wyuan.org>

Thanks. Jon would be happy about this, I guess. ;-)
