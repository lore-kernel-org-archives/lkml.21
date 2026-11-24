Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795517815;
	b=lMowc4uFyhesKa7okQJuFXHTd1WneqzkWAou14b23tycaqBtjWjqS9GlXve7I4/1bojc
	 eqeJ7c6KNQcdKYNMXDYNaD2zU168TKdnfwK91Su2ZyMik1b4W281S59srt/0BvcpIRYfl
	 gMIBJ8iqzVpCKrCmLRQ0xMp1MIi5x+bVKS7Y0tBZR38uom0xnXlkQYLo5iZzh/95/gsrT
	 Qr2/KeU3vBbABurmqyVNyeqcknRMW7NG8LpFZCg7/jVxn1ZPBg8TKh9E/CrQO94pczrN/
	 SOuqK3rkjytSZxvV8lJRUyuiEdYpOzdcEUBdy/Ey9J1tnM6Kwbs8lbNOvE9J/QHTeGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517815;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
	b=jr4fLBkgcrjFXP6t+OO4soE+b4LgGyW4dbWo121I0bO3Ol+U7e/BUs7JiVac0r/iEOCY
	 tNAzNAbP0kSV6z9r93hhtcvktZ1YYE7/u8Plaf8XK/qvxl0bRKp5l/G1BUp4iLbhwdttK
	 gJN0fkz3sA7BlXEMkLkvNqu/7/tUXT79cUePsXwRpW6kXDoahKO3zkxDvPxzDNy7zhwpH
	 D2yMU85r2b3akEn+5GxMsaUUrqHPicxkb7iCYsm+1B7zlrpJSXb5rwTMrmaHbCPye7xoc
	 svoV3qp+65hLUAUXfJedNs4Bd0GdnGIFQmrbryawpJh5+3wI/ctSbbbIv88N+X+outg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jIz2efb7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XCVcePqS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592EB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 592EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jIz2efb7;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XCVcePqS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795517814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
	b=jIz2efb7kfzn3tVsUYgofhmPVjMZK0z8tdr/Rm1ubVtaUqvAJZEF2KEMjuwZh4wDij5k6S
	uY63qfVpQIoaB760fHNmLKiDKC8Ehi8iFmCcR2RbsdyY1F1RhJ1sbgVK0iQimQa4c0PTSs
	dtbT8GoEDeIDQhvEQOw3Ra+eSwt9OGc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-EDKVLSgENHagOGt56UbDqg-1; Tue, 24 Nov 2026 10:56:52 +0000
X-MC-Unique: EDKVLSgENHagOGt56UbDqg-1
X-Mimecast-MFC-AGG-ID: EDKVLSgENHagOGt56UbDqg_1795517811
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so1026657285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517811; cv=none;
        d=google.com; s=arc-20260327;
        b=rffbWRkKlkknW/CEu68NzVgETetlsBMFdFQdojF6djdfrljfRQnlN98hv+oknbzk7H
         jPeqKe/6QY0snbOaLE7KVbXlEh99ut+ABRHbO2nLryEK7j7vR7iO3+4PVTXdp8JtCjMq
         z0Zk2V0TGEijqGrqT1ctIw/4yx9jtfC2vl4++B9A7W7Tb++uQK3+IQ4hpV/13wJ73I4B
         jzBSQA2vHx6VH90utsLzm6cCxtvRA115tExKdKNGxPZToih5twkVCIAR6/HvRrs+G03p
         uhuNTWLycAmohmxYxk384AL7M0jCZCyo7kwMc5Trap10Uinl0Pe3BJs7hQFDgHDIxAAs
         ngrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
        fh=LwAm6hc8wlYaZ8f87sltKUfuLkSiPDezE/p856zd2hg=;
        b=VLL18NtenY5DkWvfakViiujwsseLFpJ/lViX+NPnofbfsa449rIFKL0PXrzAab4yD4
         mOdpl7wis+dzDVyPCN/lPI7l8B9CLZFv7AjGFWyqBd7K6iQR1YWmro9sQOVbzHlQyEhy
         gwpxV2+RJYmOZZalbqR8suqZLDxC1EzebmwRJI/mtfmP6nl2VUXRGK3yvArLtrcpcDK/
         lwvOLDkik5L3LxcvwIz3xLlVPn3HA2Bj+9Cd/cjA4BQo1UUiJweojwPYzxHKFLO6lCzk
         klKORbBGC4606dT7JH0DxEUMVF3j2Hn/Ak71OgF1BoxpGXJswBX/fF1wPW2NHWawHzPz
         j6bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795517811; x=1796122611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
        b=XCVcePqSOUks3iIbGZ00QwC40XUdVxy17wLPAYSX88ePVNfa1iJPCrf0+pYXMtqeR/
         91UhYgkPYMu2o3QBmXuB76LBiV9lmtnIotgwOn2k72zIJLGMuhpqcjXL4bv0E/Eq1w5R
         JRRiRR6pllV76XhOmu3Kosi1OFRyRAHjLUdEUVqenkRib9G1/4mjXvm25fjcx3QrfBvX
         g6xF4sG4qjMxTQNkJG3OrwTPswOLZZQm8sJGN6TYSZ0cRumOgPkIyZ5B3cYF3uz+5D1H
         1f3K/i6ilH9DoTb8SpGnngglJ+xhkAJAPG2iQn6IP1rPLW+vSGmLawvcLsaJd/THVhnh
         NGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517811; x=1796122611;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDS/jS4MsyU8dKC6AMUz/M/v6mO2eBfnVuVFitaUJyw=;
        b=SEo4BLZf6QZU1SOIdj3XcKoeYb6qt3ucsxF+jaBmLe0tVxL3EAhdljqXXNYOdOnxZt
         tM9agAAgj3M/ubWlAEqYKwTs44CC6AxRzkIORBG4ZQiDcYmdhIGFwaTK0Q+kUXTRBG28
         6ZOj0gpZo0Uec0V3Xw0JIhuQlBVjXfmVtUBgCqFBgAaa92beZ5199yWNSthvHgFzvtgr
         v9e0Mn4/yYiMlxRk9rIWqKj0nJSBHYNHNY+s0HCgmwm1sCWgPys01mPH2REq5IhCOG+m
         QPKepFF3vcXQu6WelFoupce+WrdqyBpq+7/xNjalwfwhC2OLdpQMWue/iq3cwTg07Zkj
         uc2A==
X-Forwarded-Encrypted: i=1; AL+hErGXHHhEoQbPgeacAFvbxWaPaWCAdIqw0gYqCMagT33o2XHEFFskW2xlivfl98L05zH5uF/AWN5WfnkmG+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GJq2h7E4MkLdL7kVqKj9iabrnW7Uu6tXYuFjMdHGMViGpZhV0
	wGkhRUl3gIj+I+Fe/+THudS7tFBiJDOnwHTOqkCcAtk6i2R1Nij3xB804wkw6AmhMIaRSShUmjg
	5FkHvJV7UzlbkxFB7mP+88zJ4pgNNWGRnlE7JCjkUU8iHGWzIANVeh+dJ+IcT72XuKf7+IVnzmN
	XEmSUIbSwzS6evu3Kn741nvX2ytFbkDb+y7GT+QNzE
X-Gm-Gg: AZFdTZfbhIaQrzbd7YqcF8mBp2kpB1imNyNyxqOd9+vFNJBCWRMPfQoTO5/QBEipbsl
	r1aKqXj02RrRnQt/5O5omeF8DbcOnikC4dUOdMn+m1ZxgmDfVX32PITjos5XssHqtr0VaLYC1kP
	547+wEZoxejuIUBwAD4A72xHX5SOAmbsCwPokm+8yEeDPNmrbkccpKXg8=
X-Received: by 2002:a05:6214:226d:b0:921:37ed:5d0 with SMTP id 6a1803df08f44-92137ed0715mr242412766d6.48.1795517811464;
        Tue, 24 Nov 2026 02:56:51 -0800 (PST)
X-Received: by 2002:a05:6214:226d:b0:921:37ed:5d0 with SMTP id
 6a1803df08f44-92137ed0715mr242412426d6.48.1795517811018; Tue, 24 Nov 2026
 02:56:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 04:56:49 -0600
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20261120174540.37d152de@kernel.org>
References: <20261117-vsock-vmci-netns-isolation-v2-1-d6f35e86416a@redhat.com> <20261120174540.37d152de@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 04:56:49 -0600
X-Gm-Features: Aa3M54oXKMFlMM1Oml5R3p9TM3DnPWFPNqxfUYAgRUMjL9U7VfA3l26fuKvgEVA
Message-ID: <CAAiTLFVC-oxH-7N=FOCdVNcJEEVMU7WFV_k5t+g51Ce3ZdrO-Q@mail.gmail.com>
Subject: Re: [PATCH v2] vsock/vmci: reject datagram binds in local network namespaces
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bryan Tan <bryan-bt.tan@broadcom.com>, Vishnu Dasa <vishnu.dasa@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Jakub Kicinski <kuba@kernel.org> writes:

> On Tue, 17 Nov 2026 20:01:52 +0100 Sergio Lopez wrote:
>> VMCI already rejects datagram sends from local network namespaces, but a
>> datagram bind still creates a receive handle in VMCI's global port space.
>> A VMCI sender outside the namespace can therefore deliver to the local
>> socket. Its handle also prevents a global-namespace socket from binding
>> the same port.
>
> Looks like someone (silently) applied v1 :(
> 00f445721c7f ("vsock/vmci: reject datagram binds in local network namespaces")
> Could you send an incremental fix?

Is it worth it? The change between v1 and v2 is merely aesthetic.

Thanks,
Sergio.

