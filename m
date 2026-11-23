Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407603;
	b=uqI8nBPmSNWl0UQuBMxENJnAEaavVtTDKlndbINXNzF420kLW+zRjwqvjVdTtHzistkY
	 G4WPiQGN6bfQypjfXy+dQEhbVkFxQpDRgSKDXGJXKA9EBy7vsgvFxebG7XHqtMw959CYC
	 n0PuuA8xhRv4uYAZ9rdF4+pXC8rINlL7sqWPGu3tAqAC/GWp0ALgw0ngJPe4HDVF7CHp/
	 qrPRyyW06WeCAWpXVUjLt9DPdXju9DJne0yztltYULcQwMfVq3V85T/FfWZ3MOsTsvuBE
	 xg7jLdHSrl7MeUvh7v7LdVnU0IOGiKRObDdh3K4M7gv92E19F6pEEq42E9M6colrsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407603;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hfeDOPL7wQ7EXilQcY5tUBSlxv9/ybtW6uSBPphitlQ=;
	b=qwCd66qPcjZeBFESLVdgZkM+xRtWkbV7jSN8d4QoKOoZJKhYuaq1pPLYpVU8fdfdQgeF
	 FI8joDzXEXkW8SqU6T0OE5Za9btkjwskaiyYPIhbdArvJqOi+ZlJtPeArW39kzIa6+FGw
	 6xTKZilMq37DRv0OuPlQHoUB8I2ynMMtRxfIrOQwiSEOmuPDCvrBeZ5JgD+d2B69A3dR1
	 BAbPaewBJG01/HHMV1lF2jHT1uOUyVu+Uv01MklwOfdlPcbokxMlPKJRN2SGn1+86jc/+
	 CULoxlxgpx6yMpjELqUY5APTmtigUvqhUvQG1l7y6IHyDsWaMr33XpOuU9lHrEd4I8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b="RY8HE/eL";
	arc=none smtp.remote-ip=91.218.175.24
Received: from mta0.migadu.com (out-24.mta0.migadu.com [91.218.175.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C823606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C823606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=RY8HE/eL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xxZ7A6ARsfw5U5c4K3zdosZhEZzO/c/7t/gvu6JAhj0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795407600; v=1; x=1796012400;
 b=RY8HE/eL10REvI5yxpmfCnP7le6TiOKPUnCE2qkCgV7fkcgOhbS1enkycMPr3HRQWDSN8rG7
 aNdNCSuXgC8HnTVlDBSE0aTelxSjsHGJbqgEZmEU/8KI5uNfke6eLAXt5rocIWzSg1XkI6UlA5q
 EVrG0duP29bebzdkquxCCO6hc7+h4vibBCZ0AP1GZeGpfHw1VbbzlVnTkJBPkJ3PSx6D+5nhqL7
 txpLRFGLsfIwIlAYtu8mk4XdRhM4QUAhGjOvRmqDCeR1R8pNup9AY3HpGJDwKXLtZs2I9eThrPH
 7RmoUfpaHIr9L57GMKk/03a/B3bSisp2ludnN/pbFCGyA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 53e2255c13b2d2f8;
	Mon, 23 Nov 2026 04:19:59 +0000
X-Mizu-Trace-ID: 53e2255c13b2d2f8
X-Migadu-Flow: FLOW_OUT
Date: Mon, 23 Nov 2026 12:19:55 +0800
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
Subject: Re: [PATCH 1/2] drm/amd/display: Document the union in
 dc_probe_status
Message-ID: <awO-665NEGdZtq1z@wyuan.org>
References: <20261121041427.1743954-1-takano32@gmail.com>
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
In-Reply-To: <20261121041427.1743954-1-takano32@gmail.com>

On Sat, Nov 21, 2026 at 04:14:26AM +0000, TAKANO Mitsuhiro wrote:
> The members of the union in dc_probe_status are described one by one as
> @u.bandwidth_mbps and so on, but the union itself has no description, so
> kernel-doc reports:
> 
>   dc.h:2225 struct member 'u' not described in
>   'dc_probe_status'
> 
> Describe it, saying that the member holding the result depends on the
> probe type.
> 
> Written with Hermes Agent, an LLM assistant; the author reviewed it and
> ran kernel-doc on the file with and without the change.

The disclosure is appreciated but better put it ..

> Fixes: 52771a3254ea ("drm/amd/display: Wire probe commit path into dc_update_state")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---

.. here.

Thanks for doing this.

>  drivers/gpu/drm/amd/display/dc/dc.h | 1 +
>  1 file changed, 1 insertion(+)
