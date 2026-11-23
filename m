Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476299;
	b=L0iMzSHysdyAe/gcJZiUHsK+MFO8ehBiH+11cOWE+LYX06hdizW0+v7H5IxXwA8PHfKr
	 F0WGlsyc7XymL6cOORCW26InropaCcnb8cx8skbzzd/UHSRhundcFmyj8nsDMU+ZQaKty
	 0B8nZq3MKbb3NUEykO+HATtET4CcUakEVA9WafhNhNBOFDpS2chv4ERV7feSKRtd7x/49
	 pdmAAcUfxjFwcUpgMOS5ziNIMVo56mUh7jHkQYcP92MLYlQrnie8BU/o5rifJMDjCcX4J
	 U7WBtoZSmHO0SryjA0pgQP+BBb70WLXPgDcuH399W0GEPxMT0tVIeDePq8peLo6zIwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
	b=u2gzUnDCzxC6KudZcZ15Rj67iTfrMLu9/W5cU9SndpaZSas8QW1vxRyAWoUQz2RzTGo0
	 IBMyoKSotdiJAC8ZNgVtA6C5S4AEp2qpGFy0b92MAjx2kAXOaKNHrcDqlB5s37RPYON1T
	 iossH31u2TzBSKA5BAI5SXhWkAMAqZgZgialHflo0VWu7u8KA7KksYgdfhbiVEdVmCbPp
	 w1B25k62SIrs60dZZCvqKsvTTsDVqTSBP2lDMs/BRm8HKKSv0w/Pr3q6mC+upcK5o1Dte
	 av8JU14vS3pQuw+jG07FnWCSPnOb2tgO2SHw/xNKOd5RerQZtp5EVkn++mqFh+xMS+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCFoUZ1I;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B1606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F1B1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FCFoUZ1I
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so4469449c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795476299; x=1796081099; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
        b=FCFoUZ1ILO8vaha3i2gaLOGnQ0cPCpIpOsy+OhOPaN59AqTbktpis5YAZtoigI1ICd
         9210SWT0/i8f2fzZLoblQaxyuElg+u2GD6VBXH3ObBN+HPquGvhHgkfkFSIf/fEI38DX
         0CUySfBT89fOVzzll2Ta2UqDfy+9mXOPfSehdlDKeCE70OhhqkUHNnyvz6liU9fqtvoy
         Vxt/HExOP3KEr2oXGjKIHnbukt1nogWF/qEAubvlG0oBSfeUPs3TaZ//nASKcAGf93dL
         JbcgStiqrIKvjrFfOVeyw8VOlLM909KmM9uNiFS/QQPCFcACW/2pcgtmHqIATQiU6JWC
         tXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476299; x=1796081099;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MNWlDqY5Q61g7lNZmof1nMmtIa+WfJ4+kLyYstNyQbg=;
        b=uhwuEP89tRPCsT3jayfKYIRoTmleLEOwlUGmjH9iQz+atHZUbVlkHn/ooZVbUNkaUn
         Opg4oavWLCMXsm0ZV/E+n0LpIOhwhhP0D+LvAaHjqQflRlQqSM/rXeXUilSzP5TdXSl1
         zQ9dEQcA/OsAAx7Vqe0a5aufWudRkxqKkuwpbSr1Cce6wzrmbuuXxowf7TzlvO0LqJQN
         ibIt4ooDtWByRMDzv0hOxEd4iCJeivV+b8NwbuOSdE52D9pBBejHuZf4PBjnWR03JWvZ
         Ay5woGZVtYbW7C7VVAOxM2s9bTLOXNG61TnYuz3VCbN5u+85OK1h0LVPHI/bkcUUaYD3
         7vrg==
X-Forwarded-Encrypted: i=1; AL+hErFA3vIY8TfieyLwdqs5jyrGH1sKQw8Zd15EjOiPt0AtX46bzCoImd3pt0xPF4sQ/AeEJJ+vsUzU3Wkf1dM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YHED/F1mYGucqvNGknsFFCGBdM6VpzVqUy7AMCMM1XrvMkl5g
	x5y32aa7PMfA9ixJd2GvpO59lD1EsW77UO3Kp/Uaj7rdNVzjowZFkTWf
X-Gm-Gg: AZFdTZfMnHDAG6zfcT0/wL5bwAtIFyFoq2mketWp67YnihZczFgLf9ApahOwLL7TU4a
	Mv5MKNM3iyWLJWepu82g4fpB6rT+5ZqhXKI0JfrQTC98RhgUUFv3boC935h3nehPvC55Cenm5qM
	rl85wWelwvG9SQ2YTaaWRu/RY5dZG9EA08G0kCAOC4emMfzeW+czm2xd0aqw+pD0AoLsCMdD+cM
	befMqks1xEHIR+M7/qIuyMJeETbbULyxm+Z7jBUYzvfgunwNwsD6NxcDEYQVjpjn+F2yeXS+rTV
	C8HThwclrnYhJhB3HHCMnP1mkSo7RHEqu6y47ntzOFjOlrlJcYCm+ekTPg9Fd2Z7v48Vgn/pZmA
	o57NkFA7eANlZvy4TK5zreRiDbiXM3ZA42amXi5qpVuNPvuumUWI7H+Ey3MTnNtQJ7d1qouAS6Z
	rzBAhQfX+LD2SwLCew1koy2WXfh2BlAePFx1wZ+EckgraH/+qqac7Tm4luzb5TUPFr/E04wI634
	Mh4LDNMJSd5gd/K7KbfR3m6H1Dn/JoGGrDgeQ2oa5z1yGz8LADnaCuO+jLt/VsTHd5OL8B/QqrB
	7eTfGfxeoc6hMhsnWivGrmEqL8ZD6swc7+MamMx7L+yq2HR/sYYxlS7SbrU0cxm6kQonoDI+3i1
	T/uVxxZKFZP+UFrw=
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr16444195c88.24.1795476298544;
        Mon, 23 Nov 2026 15:24:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm34835125c88.13.2026.11.23.15.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:24:57 -0800 (PST)
Date: Mon, 23 Nov 2026 15:24:56 -0800
Message-ID: <a545ef5377ee473829c3780e94d107e5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting firmware
In-Reply-To: <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
References: <20261020122712.526797-1-l.scorcia@gmail.com> <avZiZoGO4jXjIP7D@google.com> <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Luca,

On Mon, Nov 16, 2026 at 07:53:58PM +0100, Luca Leonardo Scorcia wrote:
> > There is call to goodix_int_sync() right after call to
> > goodix_start_firmware(). Is it still needed if we call it here? I think
> > the vendor drivers does not do it.
>
> Hi,
> unfortunately yes, it's needed right there on the Lenovo Tab E7.
> Without it, the REG_SW_WDT right after it fails with the error "Error
> reading 1 bytes from 0x8041: -6".
> The vendor sources for this device [1] show the call to
> goodix_int_sync exactly between the two interactions with the WDT
> register.
>
> Actually, in the same sources I see no trace of a second
> goodix_int_sync after firmware has loaded, so the existing call could
> be moved a little earlier instead of introducing a duplicated new one.
> I tested moving the existing call on my device and it works just as
> fine (basically, my patch + commenting out the existing call at the
> end of goodix_firmware_upload.
>
> Which vendor sources are you using for your reference?

Sorry for not being clear. I was looking at the same vendor driver you
linked to, and I was asking whether the second goodix_int_sync() at the
end of goodix_firmware_upload() was still needed once we call it inside
goodix_start_firmware(), since the vendor driver only does it once.

Since moving the call works on your device, please send a v2 that calls
goodix_int_sync() inside goodix_start_firmware() and removes the second
goodix_int_sync() call at the end of goodix_firmware_upload(). Also,
please change goodix_start_firmware() to take struct goodix_ts_data *ts
directly and use a local "struct i2c_client *client = ts->client;" temp
instead of going through i2c_get_clientdata().

Thanks.

-- 
Dmitry
