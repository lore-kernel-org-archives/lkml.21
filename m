Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122650;
	b=XK1SJVMWyxDgRgINuWrJnIAKtPYVjqopv7fGr/Toz3FcwhlNasfXu/73hjaDL4oB2VMM
	 7r6TS/X6Mfq/HN+xABg4urxLqpDG03sqojVsw0t+X2L8ymNch5uNi8JhC901e8T8rwody
	 OiMmQ9miw8zTFUvLMmwm+4B7HfRShuf0ceRA23a91fQ2F++oVHe+lIs8Dou4zLv/oKhcB
	 cTTHGOacuKEe1xovdK4yCU0p2JkvzdU+EMPtHXlfMrDEv4IBLwjQ2V33cJxIvobbgYiKX
	 LewJt0E0nWWp2MGwk5S6gmv4hELIk9uwzRANOwlKq9PYWwvdWHbjrY7svDBXG8sZU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y5U6njWrD4PRYLymuIC+nuulMZWyQK1ghfLznW+6AEM=;
	b=X/yWwQyalEG7B1cujKu5tKhy6luOx3AB8+otJMkTaWPqHV0gL4llAti10SYYpg5RhZrU
	 MQ6CawaPpchOdEdawJvdOBDmEe1PSLK0Z7k5xBJTcevQ2qJRD/XMv2QX1Zgvbw0zbtPzL
	 t4vT3IGb32DHI7s3dQVqtbkYOHkDCWO+qeL9qnZ5w6vL7EwLC8CoVI5+/c3Jfmv0E/Azc
	 2HdAJzhJemh/Fa6Xywgvki6OTzV7w4Nx1jR8PXerZ4kRt5OnCKUFuj3ua2IBndW1fMZta
	 QwrlY6WxBFuJgXTCNy63ikycb9tvR1ybxW2WqDwIJFDvpIxqWf06S8Ur/t5zL7P/jAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCP3kLMX;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1619B606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1619B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCP3kLMX
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso238974c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122649; x=1795727449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5U6njWrD4PRYLymuIC+nuulMZWyQK1ghfLznW+6AEM=;
        b=iCP3kLMXRPed7S9bJiG09JN/i19X4EoKdfuX47yJoyHTjU2fP14WJ46M688r92Qp5q
         +huNC4FWM7X7qXkM5atVyXyOoxBHx0L7e84UdWP7l0GkReWXfnyI9t4tJxbquQoQsLhe
         1pe1DSTPLjKf+XC5qZQ5FGRSAFvEhvosPiuS/UfhKZzWwsWKs7BKZXQK0L3TFb2gsCpQ
         EfneK5gQPeWRs1j+tvebD0EgjIJldr4OasjqSLqWiRc8H/CX1ztng4w+nrqRD4ZX6tkY
         SBp/yjLUNhxsdMtp/92gznC4m3/M8+m5OlxJ1bCEbbCvKFkN/lCpi0suNNxTzyoKfC5A
         Gvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122649; x=1795727449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5U6njWrD4PRYLymuIC+nuulMZWyQK1ghfLznW+6AEM=;
        b=KH6GkrYnwc47V2K2ue8z1EsZ5wBIFODsVMK0lS2105jcmps+97r8+QrKkwnP/MKj8D
         wDFIzEUp6mdwI6DJpHyBJdDZgRsXLlLZTkKM2I/t71xe1ry8iN2upnKri708msralm3r
         SU2zvo537E4pByqafWRdeeK+hJwMr/dqWi3UD8FNHIQLzy+YjRCLdfhwci8jWJnV8NfE
         uo7YRgynBSaVzt+KAtJaOo44DT7mit8e0pQnN1k20X+zOiNHNELH1QNu0W9BxXeObVQF
         LzGyQtK+M04g+Ulzfk1lrvH0oKNufY7ECf0C3XM+3Fb7yh+RYYUuj+/Q0EyXyiSeFjZ3
         r/gw==
X-Forwarded-Encrypted: i=1; AL+hErHfO4AIOxaTrysYKG96w0jvRhzfVNl6BiH70xSPdiIKy0BssJaYkAehIFDZ/NYEmBanHUtEP5triRDMEZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/82yRYemvKFVwvHECJN1YnOtk8hP31uJLc6mi0BPQMm0idT6d+
	nA+ohavgBIJImmqJVaZA5KLxKW+oyCA0iVz+lYNLSBrQS+spv31da2Nw
X-Gm-Gg: AYBFou2wwKie4bJNIJd+t9Fn5ltQuMzTRDySVYvkfPzaYD+wzgD6JfgEGFb9AJlDKNM
	NUDQ4iRkrBcuPQ6JCXzeSBlr22UmhBHt5be/FnDLmA/ocMScjyKgl0LXQ4Z907RTHRSIMLUOYg8
	nEM/9LnlVSvdpcAAvtwSnYp4VA7CAr31TaGvDq50jiu43rMmqrA7ytZ6IQBY2bOhuiqZrQbj25K
	P6iXZHUu+/N5BqG2v+qRMPyJ44ER1tHEp2e/qEiam4vzLeI0F/vZZyMrqRujhBpw+FWmvHnhLa5
	fckoXOK7gWtQkdgi0vooqICo7/mhwZD6uvZIZqNkelnVJquNKS5ncmG7CmR+k2+Db5dzSCmp+qs
	Vhjqiku12/pSIwZ8f39N0kK1kY/S/I9f/KfPqhv45uALqFYwDMvux+OhMBLITMIgsPiRzLDM+Pf
	HtRrIuuHKdbZg5em7WLSjru8DRuiozc32dCoQ8HgXP3NluS0sO92hlNcAGdrNuOGFlFBNdkyL0B
	56muumV2bpEs9yENsBr3FIZTTi9ad9HSskm+KWHuEKSBuUBJvqw5bUeFQynI/SmujQdBaswB0rU
	0hDhYDEF7v54mGTo5nc8Y3kckHRZoobbuAzKN7yxfgNEw7EEccxJsITh9p1vfz5t3Z9Q7ZU=
X-Received: by 2002:a05:701b:2091:10b0:1b5:3616:59a1 with SMTP id a92af1059eb24-1b55687e5b9mr800510c88.8.1795122649174;
        Thu, 19 Nov 2026 13:10:49 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:861a:3517:4ba8:8641])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm1312003c88.0.2026.11.19.13.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:10:48 -0800 (PST)
Date: Thu, 19 Nov 2026 13:10:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	Gideon Heinz <gideonheinz02@gmail.com>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
	Edwin Velds <e.velds@gmail.com>, Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 00/33] HID: logitech-hidpp: G920 force-feedback fixes,
 rework, and cleanups
Message-ID: <av9lbJa8VlQTeatR@google.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
 <p6p98p0s-5p97-q584-14sn-ns404p6s3orn@xreary.bet>
 <49nqon1r-32pr-19r1-0r65-50494sq350n5@xreary.bet>
 <sr340r82-n378-035n-78ns-nrq4p808r3pp@xreary.bet>
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
In-Reply-To: <sr340r82-n378-035n-78ns-nrq4p808r3pp@xreary.bet>

On Thu, Nov 19, 2026 at 09:36:07PM +0100, Jiri Kosina wrote:
> On Thu, 19 Nov 2026, Jiri Kosina wrote:
> 
> > > Wow, what an endeavor. Thanks for looking into all this.
> > > 
> > > I've finally got to processing it. I've applied 1-14 to 
> > > for-7.4/upstream-fixes and the rest on top of it to for-7.5/logitech.
> > 
> > Ok, now I see that you will be respinning. So I am dropping it for now and 
> > will wait for respin.
> 
> Are you planning the respin to contain differences only around the 22/23 
> patches?
> If so, I'd prefer to still take the first 14 through upstream-fixes, so 
> split the series.

I do not have any outstanding code changes for this series unless you
have some comments.

I think if you simply drop #22 and pick up Gideon's tested-by you will
be good. But let me know if you want me to apply the tags. 

Thanks.

-- 
Dmitry
