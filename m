Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950658;
	b=4Kp+9jvaNMzFmFdRyFQAWv1aqTLSMg7BJ/4r0Pjwq+AouCrChmyH3xm+IoAhqRzy0uGy
	 Ic6U/985a1WmGGdbLInZ+TnS4t8Bp+2GVp76MJ+rNEdzrZJbGGLmk1jnaUiCaANradwRc
	 GLJlU7dOEeSHpPk1IVxyGBC9iqQ2XZXECIQsoYNy/17kudpS3XF+VpON5RHmbxe/7XyJO
	 bxLrq62z7vjcPb64ZPpnj49qnMqsHL4ZhcfaSWz2wrAvqbE0I2lP+ZFjW6cLYEgbycwll
	 WMkXiMq24cts+agFdQ4I8oMBEAT3VODqCGQ43O+8VAJ+HjK10tlJagiqc/yDp+XY7ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=J/fjCpBeMUF8gNXxUY7RYX8CVW+S81rP+s0YQaibwOw=;
	b=D9tBF5xEJit+PWax63/P7Tqih6PyUUMhdKDRVM/rCYuIPp+4TDiUTWCrg3ooYlSKIiSN
	 6lKZoYs5Ez40zL5K1GOjupkcqT1eXUcFdyvhJX8W2/aYkKuUR/fbMs7XWkmeGmIZ7A+BF
	 K0A0yQBMMVkuUfBunJcKZ6ampA2WhvDfXQ/AsOuZLqF8mLPoYKmwLpQUdc4brgWqtxwIN
	 2XeRkaWpXvIY+o6Z8cSxVDkEggansKpY5YAwdNYMm1Y2vK6Hr4NsqpuMkAW+8ugfDrTFh
	 yYK1R0XTeFfLjd4Nqs74zc4+tuTlNqoUxN4Xfow3anrvaTCXwMjjbuACPbYt3ztk2eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nxr9m7DQ;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7118606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7118606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nxr9m7DQ
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed408b0d9dso1225135ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950657; x=1795555457; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J/fjCpBeMUF8gNXxUY7RYX8CVW+S81rP+s0YQaibwOw=;
        b=nxr9m7DQhADZJ0A11Vgtv9+ajmQSQVyjgxlF4UwAbRrS0p+4aLCL0I3w9+n8hCnAcE
         kjwiv5TjLKTSGMaG913wevcCAjy+0kZFu0WQDUaACQ06JCCjpAQEgkqWNeh/KD1jGktI
         ynt3rXfYw0l0vQ/YqcKzSN7xwFu7Rbe0jP1QxDANz1zURk/krMd5ubwFuWiIxzpXqBbg
         jFXwEKz0rfsOmVSIhERyJ6WHu+KZ0H9I3EM7G+f7OB/0bYQ6xsUORuwZ6r70SEvLo2rH
         hLxNxv6VSg1nz8Gf8vmXTRaGufNR8it5NUuNFRh0JEBJCW5TkDavFdqZAK5rDa0c60Rn
         Ui3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950657; x=1795555457;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/fjCpBeMUF8gNXxUY7RYX8CVW+S81rP+s0YQaibwOw=;
        b=YRu9QwUvJ4Dp992fJMX4+37BDdtnxFnIUN7vEr+RibQBHccXuKZSZ5a22qo0k65R0r
         aZGa9ehZp4ragvRq2GprqRCDN4/TFeTAzQDyJLb8wPAYLNJ78XpP45E+tTqD+GiwTsHi
         wI1QxbGRvcK8UjcS+gWHp3gWGdveKvraZBB+gv7Kk6BFMIs3qyv7fTiKp5elPD4o5wcy
         Gi6d+6nTPswYunCnZBu5S3Vse7V3OhAp1OrclEg0BW4oH8nHPLY8zVy6CjiqCwm1I+9e
         a7y7b9rwf+Sh6x2olhp5VLTD/RuUcbitFOoPpCZEhCYyt1iLOfHvoUB0Tnr9VaSo84Dz
         qj6w==
X-Forwarded-Encrypted: i=1; AL+hErHROUC250FtAsnH62W37MaMRxBT3kWtVilOcShfMAjAFRh5AidpI0KZhDI6IXcaaPe0w1piNhS95ujRZys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zKQERAwHR3JtLcq442T0Hu5ONH5LTYu0ube66pHZCQwl3FdbT
	oCQgE0RwIZGmH4cqutKKsEmBlszS8uhiF9Yy9CZ3xU9wreioGaYFak2cX/xWcChf5w==
X-Gm-Gg: AZFdTZdNyJoTJeJj+bpprJRsXViV+WBI5CwEmDE3sy10q2eAWXcW4JL8qlQKQu25IwW
	oKwPcznQjNBVRnU1O4ZumQvYKzFGkfXP8dGQ1NrH15miVK+HH6TC01VKA7IQMuo3J5jdO2d8Rx/
	rKjRBLt2WEnaWw3HU6eY7V+byKmNu2W5SBUJUPiCQ8GqTND/PQ8hOyiqq1d4I14mHU8saSuhJ06
	nnIp74APiMVbAHEBz/utCkDt5M7j1XxuLdSfXryzd+Jc+VxST5/xddCBRW61K90D/oBOeUAB+bX
	SnZrtSVY/uY1908kZrqwjvOnif7jV24f3KKel+N7Us5irjhtdYpkDXOrL1PJfNafFvrV160cWa7
	t6MsSBbIwLobFEin8JGvgdUX/Gzta0cS9y+xzISx84qCDZ1ve7XGOP+Jx2yqrxOP5CKCe3NGR26
	bg/bplg+JZwkDlwYoumApPsPfJPWnGs8X6UygVQrrVTvnlOGwNRbJyOvyWzXcCJxK6xQt4YBVHb
	PbBWRyiIJ9ycSbcM/J4+k49PUhWP2dIg4c0ql+cs8GRdATd3YHSDJ3pRTpZEVwe4TJgNv9W+9ot
	hJXMMTNkm+aBSfRriVPG+1EQyRhTma6c57BfA835hkNo2EZcrowxs+qTYeSbWBde
X-Received: by 2002:a17:902:d583:b0:2ef:ee74:78e with SMTP id d9443c01a7336-2eff72ea998mr4954175ad.13.1794950656357;
        Tue, 17 Nov 2026 13:24:16 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617eb61sm2650725ad.28.2026.11.17.13.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:24:15 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:24:15 -0800
Message-Id: <DMXSWJDPGJLE.30NVP7WQSZIZ7@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-pci@vger.kernel.org>, "Adithya Jayachandran"
 <ajayachandra@nvidia.com>, "Alexander Graf" <graf@amazon.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Chris Li" <chrisl@kernel.org>, "David
 Rientjes" <rientjes@google.com>, "Jacob Pan"
 <jacob.pan@linux.microsoft.com>, "Jason Gunthorpe" <jgg@nvidia.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Josh Hilke" <jrhilke@google.com>,
 "Leon Romanovsky" <leonro@nvidia.com>, "Lukas Wunner" <lukas@wunner.de>,
 "Mike Rapoport" <rppt@kernel.org>, "Parav Pandit" <parav@nvidia.com>,
 "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Pranjal Shrivastava"
 <praan@google.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Saeed Mahameed" <saeedm@nvidia.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Vipin Sharma" <vipinsh@google.com>, "William Tu" <witu@nvidia.com>, "Yi
 Liu" <yi.l.liu@intel.com>
Subject: Re: [PATCH v10 08/13] PCI: Save and restore the ACS Control
 register and Egress Control Vector
From: "David Matlack" <dmatlack@google.com>
To: "Alex Williamson" <alex.williamson@nvidia.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261013162529.1928093-1-dmatlack@google.com>
 <20261013162529.1928093-9-dmatlack@google.com>
 <20261116171017.2342bd11@nvidia.com>
In-Reply-To: <20261116171017.2342bd11@nvidia.com>

On Mon Nov 16, 2026 at 5:10 PM PST, Alex Williamson wrote:
> On Tue, 13 Oct 2026 16:25:24 +0000
> David Matlack <dmatlack@google.com> wrote:
>> +static void pci_allocate_acs_save_buffer(struct pci_dev *dev)
>> +{
>> +	size_t size;
>> +	int pos;
>> +
>
> Nit, moving the device specific enable test here:
>
> 	if (pci_need_dev_specific_enable_acs(dev))
> 		return;
>
> Would avoid:
>
>  - Allocating a buffer that will never be restored
>  - Saving ACS state to a buffer that will never be restored
>  - Testing for the device specific enable at restore
>
> Otherwise,
>
> Reviewed-by: Alex Williamson <alex.williamson@nvidia.com>

Thanks for the review.

I'll make this change as you described. Preserved devices will still
need the buffer even if they match a device-specific quirk (see my reply
on 09), so 09 will also allocate it for devices that were preserved by
the previous kernel. Since restore then just checks whether the buffer
exists, that is all it takes for preserved devices to keep their adopted
controls across a reset.
