Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785637;
	b=3v6BvcffEWln/n+5m4x6QLTnVDKGpBda39UxsZMUcd38Img85FHVOAsB+ETKMmhXJcpD
	 7m1YXtIswpTpN6mW/fxab4IisO3pk9mILBGXB6kpr25vXrDQYObdyw4fNen8peAmnozWO
	 YIiP+6thOyLIb4HFPIR10malvSzP7waJ/YNHPSFX7Gn2LFDHnayBIFLNU7DzYqBCkwlbB
	 N5L/frmsdpi2LdnngwHW04RIvg9hY172/lJ4aUfxVw7IKsvQ3WNkbBAVkQMKkzXKSBjVa
	 rS+sSZQmzAqNKAIx+HWleiRXAvG9j6y196+CF8uYfyxjTy3SgvNq3+6BWY728FzkdIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
	b=W8LeNJBjLR4eklQYAe52E3ZBBSVM2xqvktqanEjXrHZPyL7Fu3dOdrH8qRJi+neA00za
	 C/XO3R2eyhhzpLGZd3rHZ6gva/PH0xPQKpPURTLx73RDz69VsWdl+ThEQhN/v28OIIlYL
	 qBq3kRV15GxZLJ6DbRzW5oOERJa9woRLMpKB3XiUSCiurZj6vOEakI0GZ9ry/8YmoSDJF
	 2FitqjvBgiHsNGcL8sROso9wUwq5uSQAdcsS4pZgdtTCuxw7SyqdWMTzP52wLQIj5EBJT
	 YnV4LPo1ShDmIer2eDOayi52ymaO4glflY+kNqjkLTNGNgMJjbXC7fw8LBTTIejtX8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L82fFvNe;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E7606A690
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 659E7606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L82fFvNe
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5509931f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785632; x=1796390432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
        b=L82fFvNeBuBbQ/UMiY0am5fSBNG8SHGYx7cS8n0cxl756hwrwwxPjEKnz26xtxl3Mh
         eZBy+hrCagwNOc0a3JyD8PvO/OAmJlF9nDtvzgOT4Qj/ge+DUDfW5SAtMtZ1sX+O9gEp
         F+OuP+4KbSVL9LknpvmjVKW/5F25yRKHohDDsmL0w+Ih22/JWu8HGMRtTrZSsA+u5obi
         FWG0fSR64lQXRnmUyEg3DEATLthFGgdr9DMMmqInRgYeS0iLvJgbfIcag68nBIAeUgHb
         ayhfqMG9qgk7IGe2TAXnS9enVaIkP4aGVJi6n5jpY4kOx8/qlDQaPJYNJpGYrHWPz6dO
         JxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785632; x=1796390432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+C2WErvkSsOZ4sk5Sz5TIE03pd4kWi86iFdjsd0GLA=;
        b=sTgtMUF+dmUOQXxzgbHACBkx2jcC2fbKDCvYSzJ3roWEioCEc5jOgbjx+8bUPBHpEw
         AT5INpVpSlb8+pEc8JSHkDPyvVEwOmqn/+rPJdUImSDUkTMo3oxgQDcbIkqz6a9Wp819
         GC2AWlgzLgtIbJguCvd2n3aPHwWO4hb4gwgOlMXdjaNtvkKEz/41azvnDxDJykxqKnqa
         rmVQJXHpaMGDM2izQ/SicMNJncwHRkhTYwyT7KZ5PuFmCeFY+mJMhqM/YiZ45wDPC0aK
         Nx0Bc19gl3JDXNma1B7meyU08geRCIhSv8d7sE2HoPnhlmdXkwZ62DY27g+IWSO+tpiV
         NpkQ==
X-Forwarded-Encrypted: i=1; AL+hErH3w5tCW6r9aCrVNOhKzKNL2FsxaTiUW1KaxvhqPeDbe9SfG8r1Ue6ACHcJUXYKtoqT19SatcsXH7y0tLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LtcQ/omt0bQO2YFyVwQy2y7mUfeqSrADz5uDfl7wLQ3YMpvKZ
	GltSStgpkuWEfMPH6FxjmrzgIR+ZBdkd6bfR53+OWoN8Kn940CPHHE7d
X-Gm-Gg: AZFdTZeXVGklhLWCf4Zq/a7XH6Wlkf+atlRbJpwgziTOmwK2QwNciDWqbRUFKK0wgOz
	dlo+Bp4Di0jdVbCBsOCVCuANHl1zMe8jSu6nNBs6kY2VLSzO7HUKHs9FLf8kwghKgg4SRsNn1jA
	3Fv25+BETmp7PtSu1oMZ4V0NC7IaITz+9KunfrqSDg/T69dT0dkk+7bG35TvSTmt7gI2ggDFOZD
	zLUuj+obg75bMrLbaPSZOIF4lYcMsvjsPjP0k9nltd5nrIk+hi6VhyksDYW1qFui8it56z63dyQ
	PpFkMMpfmDJ6CZG2vYkP5erULwg+VrRKS485sAwB9mXZYhv+g8cXZFjQ6quix2qR3f3C2x5p+JL
	kjK/YhyaZKziH8RoXCQEnGBzQOst/edg1SLRZ9U7CqFkDcuALE/tWJFrCL9VKODAMXLEzSr6o0Z
	013n85Wx/NmPV7iXoTCzfbZtemlFj1k/yRJErRphgtZsm49ztq+C1ntsM0RDfKGPqRm9I4w6WGc
	bxa92H6valgzm/xU1r3TSumzPSEmKMw1m8famXDwKO0vlgXbiM4pkmEQeNkqgirMH1zTOY8Lyxc
	qxJZzulaXE/7NEKtJvo/L/20rX9Sf4csSMs=
X-Received: by 2002:a05:6000:250e:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4aa5805e1e3mr58576532f8f.21.1795785631616;
        Fri, 27 Nov 2026 05:20:31 -0800 (PST)
Received: from gmail.com ([2a00:1bb8:11c:ad4d:e281:a398:d85b:8a2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm48315205f8f.33.2026.11.27.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:20:31 -0800 (PST)
Date: Fri, 27 Nov 2026 14:20:27 +0100
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Flemin Jose <flemin.jose@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] virtio: Add Qualcomm VirtIO transport wrapper
Message-ID: <awmAScxDZqR8GRy5@gmail.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
 <20261126-jshekhar-qcom-virtio-dcp-v1-3-7b49bda74916@oss.qualcomm.com>
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
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-3-7b49bda74916@oss.qualcomm.com>

On Thu, Nov 26, 2026 at 11:54:01AM +0530, Jayant Shekhar wrote:
[...]
> +static int dcp_virtio_transport_suspend(struct device *dev)
> +{
[...]
> +	ret = virtio_device_freeze(&transport->mmio.vdev);
[...]
> +	ret = dcp_ipcc_enable_irq_wake(&transport->ipcc);
[...]
> +	ret = dcp_ipcc_send_power_notify(&transport->ipcc);

Hi Jayant,

I've been trying to review this patch and got a bit confused by the
.suspend implementation. Why is the notify needed here?

The rest of the code seems to imply that a power notify means "wake DCP if
needed" (e.g. "It wakes DCP during power transitions" in virtio_qcom_dcp_ipcc.c),
so how does that fit into .suspend? Does firmware treat the power notify here
differently?

[...]
> +	complete(&ipcc->power_notify_done);
> +	if (ipcc->resp_vq)
> +		vring_interrupt(0, ipcc->resp_vq);

As far as I could tell from your comments, rings from IPCC (separate from
power notify) are needed when resp queues are ready. But why if we already
have a virtio interrupt? I kind of assumed that this is what was meant in
.suspend when you enable IRQ wake, that we may need it to wake the host,
but while suspended the queues are already deleted and resp_vq is NULL?
I think this also addresses the race Sashiko reported: this seems redundant
or I don't understand this mechanism fully...

Thanks,
Stjepan
