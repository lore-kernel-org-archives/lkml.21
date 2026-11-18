Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014693;
	b=yZ4Wlm2VP1WRBjerqO0Kb7nf1Rf6pcp7WhEJabPPp/FQHBMk/zePaXZ341R7nB81IAPD
	 EPpPCwprPwJRN6eRbPGLxzFG4DJCD+DlRTMf92/ZEr0U8Mn3dsiu7rsnosOsqLHnopFzd
	 F73HlrsYhafAb0H+nUlRZV0Di9XykU1uQjWRXsxcrsvqlqp0X3faC2NrIiBDYQBJ1nrpv
	 QnafvYeSiDmlEqgzZopLq2Nkj0weaplKOVhQ1C/0TMRRORiy9yBwokiVAt223YOpURVrD
	 aI82m6mub+kM46xOHCDh8Xfl9zcy16G2ix8tzQCp8A6MDrSNbOfY5+TQfogy7Swz3bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3dbc9FtYFsNBAQJTQDYXrpm1FEVXqiaNfFhkTK5fcB4=;
	b=WewGBPCL5O9fgmim9zateuhecx0RFsMf1LRlyxBXNRPBOuWFTid84KwgvPg2ELBW3Nyk
	 wlwO2Rx+ybK8LqXP7zQXF6Y4xrlbcMi9/KIPZctmhAuQT5XFPepFMn06H4kxVRPSvbmgd
	 hAw3c+Aj85SIkwLOunacocUWJlv4wmERquI+EyyflJLOnOMPpfweM5PwKB6X0ELjW/aNP
	 b+WZx/pDMpW+KRPrpvV9Bj+Ra9aNS+QC3JRp4MSjd7qlDvTGhBfeRIEPSFmKGlsVUbyVL
	 exqW4aMgp2lYTDu8nNnoEIs025A9FcLJ9he88QTT12ITwBWecHQkc9OsSra5Q2c1CJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=YLLmwUoP;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE4C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=YLLmwUoP
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5430f70c827so15713321cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795014691; x=1795619491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dbc9FtYFsNBAQJTQDYXrpm1FEVXqiaNfFhkTK5fcB4=;
        b=YLLmwUoPDrLpCT45kIwK7Z77E7yysow9q9O5x0Bb+NxtiS/EcVBIgUUFPgr3Ixv4Ro
         7pmKkpBXG0nEf110i7L86xIebwhOr9fYgLIvwS8UTvbikT9UTjOCG2b3kf9q0MKITC+2
         fWkhYmGMkeV4GqqQGtfusTv9OU1d7Pq3f1DSGSDJBSpuXSr8A7uSgrjyalEm9Y0qfMiE
         h0qdilZHSmDzOZKAswOd2DfFakf18goK0rar9X+AWnNfD3QzyK7bfEbTzKMpWBxaf7lS
         dzlbDtxWLwUsdfSyWi7WU6BBecODgBnQQq8JBgJ3vcRdkZY9LHQ+IZUycb2m4GfuC/bL
         Dl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014691; x=1795619491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dbc9FtYFsNBAQJTQDYXrpm1FEVXqiaNfFhkTK5fcB4=;
        b=BIcY0PBnLMoMz2c4OSDa5XMaHRU+N4W/0FEtY7lLelYcTBC6bdIS/D8m7wcmLhmyhZ
         sVIM3UtKLKNz7oha2cgQwO2STHsYTNk+7hFEnH33n2JJMScvFCbIAxuDCBWglO5A3iRf
         wqTr5L26BdYeLCMCfz6PaIYsGeEAriGbN91mTuvnzD38AkZ8NaFv9uXEIb370G+24ovz
         R6hK5hafNQrFx3pS+DYa2/yzsuI0kMdQKYKojESBhcq3WsM9geQxL5DjJ0jPU3QzI+ud
         0upZYiNYUBLQLUmo28u9BtTs+XmOZgI8dMBVKvAb/JwzGXIH+k1wS5P1OTJ32ZmQljyM
         wgXw==
X-Forwarded-Encrypted: i=1; AL+hErGBNKs2si+PMMkVNFhWRGqYEWb3zJY7riHdIXxWSnVtUTj7UEWAvvTt75FF8uqUDFebS+Z3OGcnOvXvSK4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1312XCAdY2EUH4k5NRaEoTebNyU3Ov4gE6dHrnjRD1Vz/j/lg
	WzOJIiBsTKz8Sn6WHSbCxiVLAyrdJreVO68k3LUJoPn7BVYxzfxjXIO8SlhJTZN06A==
X-Gm-Gg: AYBFou2J5+5UFdlYrVXfChqOisw8bOQ435Sjl4cjTSYVpUX5yt+Gl5P5KJhEtZhY9Br
	6XQ+1D5zQggQzbnvkweuF2QefMk3indASvxQ4VTVtro15AACiLoZo/piZhC/AK2jS2ic+cPcJWe
	8ZnahGJHT4fJB8dTg+mF6dkTwwJtZGfYxM8LKR3PjdBrU7z2RxRPQgoCZp8m1aLmjm8w7+bZ05p
	CzZmquy8gdiQU3rH9dUHGzQgYE6qDJ6pi3dSYFZOCF0LQNKVDkS8JgymcQrRWCVnDYDgcdANKrX
	+JMMAP54LTQgD7AiR5dTB+8prHI7KLQsuwQ19rHk3TH7jGJfax+CdbHKH95nVra6H1j9OMzv2fD
	KU+lyEd0KzvPYMJbml5ycvoBRRj/swCPiZP9OrdFgGSSYgGsMRwdbqxuBbeMA96xmG96WIAnTBg
	LPSV8pKlqzQ6wiRh7JhiWJbgUOaXfxrL2m3yC6Bjqbh9Z4ZEPVWf8pUBMbI6ohZExr/1TJEZ/yY
	lK6KVXvQ3yjNEvUwVg6xDWdxekbEmNXeIBb2wcjU7XReT94YxRV7Bnlz9fNr/Nx23mEz15gm0tl
	erMGWClemEkuunUnywWlRBTxliOzJbuE+otJoqDmfA03BwR3
X-Received: by 2002:a05:622a:90c:b0:55b:200c:76a8 with SMTP id d75a77b69052e-55d5a62a287mr44788291cf.60.1795014691229;
        Wed, 18 Nov 2026 07:11:31 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d667f0be4sm1963751cf.0.2026.11.18.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:11:30 -0800 (PST)
Date: Wed, 18 Nov 2026 10:11:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: aiyengar1990@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] usb: core: Pair ports of different hubs through
 their connector
Message-ID: <56075489-e1fe-45a1-a282-4cd0214b9b16@rowland.harvard.edu>
References: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
 <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>
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
In-Reply-To: <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>

On Wed, Nov 18, 2026 at 04:34:58AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> On the RK3588, USB 3.0 host 2 is SuperSpeed-only and its connector's
> USB 2.0 lines go to a separate EHCI, so pairing by port number gives the
> SuperSpeed port a dead USB 2.0 peer.
> 
> When ports 0 (USB 2.0) and 1 (SuperSpeed) of a usb-connector graph lead
> to different hubs, pair them through the connector. Root hub ports are
> found by the controller port number; graphs in the dwc3 numbering don't
> match and keep today's pairing. connect_type is looked up the same way,
> so such a SuperSpeed port reads "hotplug".
> 
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/usb/core/hub.h  |  2 ++
>  drivers/usb/core/of.c   | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/port.c | 70 ++++++++++++++++++++++++++++++++++++---
>  include/linux/usb/of.h  |  8 +++++
>  4 files changed, 162 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index 9ebc5ef54a32..a186c41bdb5e 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -97,6 +97,7 @@ struct usb_hub {
>   * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
>   * @early_stop: whether port initialization will be stopped earlier.
>   * @ignore_event: whether events of the port are ignored.
> + * @connector_peer: peer found through a connector.
>   */
>  struct usb_port {
>  	struct usb_device *child;
> @@ -118,6 +119,7 @@ struct usb_port {
>  	unsigned int is_superspeed:1;
>  	unsigned int usb3_lpm_u1_permit:1;
>  	unsigned int usb3_lpm_u2_permit:1;
> +	bool connector_peer;
>  };

Minor point: It looks silly to see a standalone bool field immediately 
after a bunch of single-bit fields.  The new connector_peer field should 
also be a single bit, to match the others.

Alan Stern
