Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120355;
	b=0iIXlVqGVlyFQhDbrpPDHlxLRH8TojgjtQMhM8W4XccUwZjxXdoUdOS2hspKAV4oTmOb
	 iilS2Nvo/zBtI7dN3Pmusi+5DzfT5q2YjTRz2d9Xx387dxjWiY6wXzv0z+kXS+PmD0Cny
	 cFvL9jtzUCTi7VJT2OVuc+gSeZNyvXDq+FtgqwlzswPNtDBVj7PZnstbXFZWB+SJItmsm
	 XrcTlzh4Qy3tQMVNZ/qcyY3XG7ZVB2N55FgMVP/rzK1OeN/FD4LcZSDCITDYlCm5tDvAh
	 O50c4pUkO9tXkQBIZFpD5r6oo9qdXA4ETqCwJuxMs/aZb5Loro1Qo0flpPRkxs0n9MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xn5mhyBYyHW6lr80G2bcaHtch3y/eIfqPoTaMRbJI2o=;
	b=UIN535X1cyAEVKGasvsYP4YiUJcy7IWZJLV4fei8XvyC+40SIOMejFhldLFI4ArNT7/g
	 D10OzQ2mcW9WYFtfHty8vkIShthkp9+VhS/fsAzZHLdJ7c34DK7akbu+k+C3ymgc/DI5h
	 jdh1PPkgw2l99+U+Rd7EdZzs5i0wse5egsXGhP3+IXsJOBCmr2ot8tE1ifnwKyRNc35za
	 s4pN1K1HoQxid3B2cR4TlfQYd14R7DiicYIVvU2Bdfav0wa5zsMDcJbYsqJSqgW5QRgrW
	 6i2NPlvDBBOhtiRPb6U7MPrpF6DfvVX1aA9LgdPpnTr1lmvmfE8q0GVUBO62gJ5I10g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glow8yZ9;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABC360A2623
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABC360A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=glow8yZ9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so296955eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795120354; x=1795725154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn5mhyBYyHW6lr80G2bcaHtch3y/eIfqPoTaMRbJI2o=;
        b=glow8yZ9x+fwdtBpevYvZuBcds4wjQwb5pkw7T5HxwXeXjjectDJKhqWkEEkXMUVAo
         iDkB1eQf65pA+YWetDavIjZxWu3D0CXdcLdC5zRdTXMVzWi3kNueRVgj6jRufzarTpv1
         gxCYBDvhbghHU4sAdIZRUE4ihqKc693X4BKNHm+kW0lNk74Bxx+PPCLkc4Z/A2urbqcR
         hI4dRLeUMIbg2L0hQHL4+a4rLN1b8DWdK78BNm7VRPUO3/6BRJfTKulUoE3DfsSi2BTu
         RSgs3Mzb6JyWNC2UFBk15BQOEpeSp47tIzg35P9FlIccQ72Bdl9/NdRjf33EW2kaivJ5
         jGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120354; x=1795725154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn5mhyBYyHW6lr80G2bcaHtch3y/eIfqPoTaMRbJI2o=;
        b=h0MG+GkrGnIF/YtorR0s5iaonRSrea2H4/Hq5az70NjyWIsSFOlwSqYdZYjSvx5MZm
         2eL/WMaUJXYWhXwW+vrE1heflylhrIWzSqMUEuVQ5UwDHWWLIarXtJ29adt80OjHKxHS
         2LlL4YQ+FnD2D6OOYbDHaeYWCRfLxzJoCX31zK+xCEJcr5dBOwGHEyOi6d/zXv/0LBPX
         fOrwOUzF+FD+qpifH2ISL+luwUgJiIZR7J+CcnakmttIZp3pFxx16tRin00yovVxteb/
         H5wto+F+VD0fNc3giXy5dBbb7DjO4QzExX+mAq8yAwd0hHKqkoY+h33hSXCjEn/fdoMk
         SAlA==
X-Forwarded-Encrypted: i=1; AL+hErGlQIb5Zd+ghVJejTG/nhDX3klq6xcXq824TpByZfq1X8RztyeqZmPrRe069P80fnYqEmTbi/5PuBl04fw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8twmaSUAZ0xKJbNaEWxGsnqR6MhRRj6MW9lkEYUFSJ3iUg4fVo
	qRb+WVvKuOzpNzkbR4vD1UX0oS1TDBE6EJOlblcpCkpx++P+Q5YA/OfA
X-Gm-Gg: AZFdTZdh9XmuAjeeeWb2C8sftqvE6rYvhe47wdBKrFdHWBJfYYwVQ0MAYrKs82MoVmZ
	J/X1gqs+OF5EM1R0hJbDUeLd3AmR8YQ0Hzwuc5/KkDJEW+pQm9sKVrzRGag2cYLhAWAdxmlnijQ
	FD2Gcs0x2u3zD3EwIjVqEMDX/aRMwfstm4jabgvqJYoluFktar3w3hVxLCYA1HKCIK9FztAURjb
	/+q/PRO4aVCjJkuuQ0iIAOKCUx23dXN4I+lQRoJdbNyDqLsUzO1/zEME9GmJEpzGTiJmk3LWmP/
	wKScr9GnTep7HvNbwlhGGwD4qisrROyfgOY4Zg1f7cLudlyKvBmwYpVJn6+CbpqzR0q43qwHE2k
	Ttm+ashytlIRviWKECtMBSl9tRMi4Wdga1nRPJw63c22W92yDpneuIshZb26BG+FJmC6huiqew+
	+PEu0L2DKFZ4yj60BnGvlTueBCmKr0V1YoV6OhH8lDzhTSDKJuW7qPM6tB8eRkhxsqWO4Vu8wIM
	Goi0jg8VxNhUUeHNJP1b5Fm8tPluu6u9p29Lg81pIU+aIxFncCwhaRI5giIP7xDP0oDGCBxzOj4
	bTjzAZi/SgeOOnGftDibTiPdUnTbpkZBVLTT5Q==
X-Received: by 2002:a05:7301:921:b0:375:c862:34e with SMTP id 5a478bee46e88-38570742392mr419227eec.20.1795120353679;
        Thu, 19 Nov 2026 12:32:33 -0800 (PST)
Received: from localhost ([2804:30c:914:4500:cd15:65cc:e2cc:7363])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm1101905eec.6.2026.11.19.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:32:33 -0800 (PST)
Date: Thu, 19 Nov 2026 17:33:58 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux@analog.com, Michael.Hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v1 1/5] iio: backend: Add calibration source interface
Message-ID: <av9dNvWzHlbvBZf4@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1795003864.git.marcelo.schmitt@analog.com>
 <67582938820d6f206006b16de71ad6bcdacfa863.1795003864.git.marcelo.schmitt@analog.com>
 <20261119025747.53b30ba4@jic23-hlaptop>
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
In-Reply-To: <20261119025747.53b30ba4@jic23-hlaptop>

On 11/19, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 10:03:17 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
> > Some ADC front-ends send data over a configurable number of LVDS serial
> > lanes and may also need to have the data frame calibrated before capture
> > can start.
> > 
> > Add a backend operation for selecting the calibration source (data lane or
> > data frame) so that device drivers can perform the calibration of both the
> > data frame and data lanes.
> > 
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
> >  drivers/iio/industrialio-backend.c | 23 +++++++++++++++++++++++
> >  include/linux/iio/backend.h        | 22 ++++++++++++++++++++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
> > index fbf5c39d7655..682d5f735071 100644
> > --- a/drivers/iio/industrialio-backend.c
> > +++ b/drivers/iio/industrialio-backend.c
> > @@ -869,6 +869,29 @@ int iio_backend_interface_data_align(struct iio_backend *back, u32 timeout_us)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(iio_backend_interface_data_align, "IIO_BACKEND");
> >  
> > +/**
> > + * iio_backend_calibration_source_set - Select the monitored error source
> > + * @back: Backend device
> > + * @source: Error source to monitor.
> > + * @lane: Data lane to monitor. Only meaningful for
> > + *	  %IIO_BACKEND_CALIB_SOURCE_DATA_LANE.
> > + *
> > + * Restrict the error reported through iio_backend_chan_status() to a single
> > + * source of the digital interface so that each lane can be calibrated
> > + * independently. Backends are expected to report every error source again
> > + * once %IIO_BACKEND_CALIB_SOURCE_NONE is selected.
> 
> I don't follow this description at all. If there is more than one how
> does it report 'every' error source? 
> 
> Add some explanation, probably to the commit message on how the
> flow using this works.  We might need more info here as well.

I've complemented the explanation about this new backend operation. I'll try
to further improve for v2 if the description below is still sounding confusing.


Some ADC front-ends group and send data from a single channel over a
configurable number of LVDS serial lanes and may also need to perform a
data frame calibration before capture can start. During a channel interface
calibration, the front-end device driver usually requests the channel
status multiple times to find out the optimal calibration point.

However, the backend channel status interface doesn't provide which
specific serial lane or data frame flagged errors when they occur. The lack
of error source information prevents proper calibration of channels
comprised of multiple serial lanes.

Instead, the backend may have a separate error source mask configuration to
restrict which digital interface source will have its errors reported
through iio_backend_chan_status(). With that, each serial lane can be
calibrated independently, enabling multiple lane LVDS channels to be
properly calibrated and supported.

Add a backend operation for selecting the calibration source (data lane or
data frame) so that device drivers can perform the calibration of both the
data frame and data lanes. Backends are expected to report every error source
when IIO_BACKEND_CALIB_SOURCE_NONE is selected.


sashiko comments seem to apply. Will, fix those for v2.


Thanks,
Marcelo
