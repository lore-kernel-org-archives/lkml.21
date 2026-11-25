Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626869;
	b=1DEku6D7JA66tii1DnlJcCB/ZlZu+Dq5OTfmcAeA3zXeJRg1A4/iK6FYo1CBVSGpkyF/
	 gQZL3AtSaIfCU42HCKl15OTWOSu0MAQyx9ggOa7VcrgyZoThkKWBOS0BnqvZUTyCWhiVt
	 70nvL6RvLaVhJq1YaVBlVSLZYtoO/us/aKyUcY3AhWy+rDdz2ua+rqVgeXUg+GdNx+QyJ
	 BVEw1qw+WROh5Rq5EIiSJQUIP+BsvEtEQqr+frq2kc5LO6Sdu73nOwB5BiWq4ZllitXA0
	 YfyGTkcH9H5PAkG4ZuIFKqG8CAYIZTBSS7p6jnGS0xO994Zx0JjkhWoOakL+58eYcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
	b=zJCu2YvV+PhF7SVTrBoOFxkGKvElxNJQ4KYZmZGeJPbD4unE7peE3hMYQvjyzMAg18GH
	 Eq0TBu7XTDVyXyy0qUlTl09LLD65n0NsptysP/8mU+XK955pMPFgRwIeuEO16P/N36SCp
	 XiLKMCwfvpAFwqPvSTO0mbpS//6sxGY5lwkx644P7+QWbhayrULl26xArgOXnNHIeu17J
	 WAcHjNvVzKqmxutTJo7PurLN6+ZmkBh30a5VZeVu2il0i3WOMGMSuU97dKgZh+ua+JI4G
	 C+a2R/EqS9BjdDkQ9Y/oGdYZtuCdPlYdZf/XEnuShqCIWlc8KYf91t+hnD5gz+bA1KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpqd1Fhd;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D8D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cpqd1Fhd
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so47195595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626868; x=1796231668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
        b=cpqd1Fhd0iLCuRWp2NcwkdW35Hhyb67oS243Wo5CL+D7EpVLQNMjTkNxQZzEzD+mWc
         t/H1D9bV/+SjDhFI/hdSBf9hZ6XtVl3VFpxHamiCuqVr0wmQuVtRP/9Ax957AQG36KFs
         W7d3qnEaTM5YYYkezQmB8cToYOZYmKxTie43HXmZYxwryHaZnQy0taHjGkQZ5D4onGnf
         N7PB41DuniDrU+Xr3mlYL2Wob1Qzj2G/vjf94pfHiEpTCDQSf/2dsOb79T0DPABT2ZLl
         9+aKmRFABSdtLriWYnIJWw3L2+14iE8L73rJ4g2+Bbrd2UtQtf6wNjgV/CKEPhcQHlg7
         XbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626868; x=1796231668;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e41widtp5DMmdFFeX2AWf3mpay/8eXwXnXNPU/S4dOI=;
        b=Zz9yYSdEr/qPXacfxjqxcMXOxeRHUv22ycfDvlM/N2tbEUoJcAxTcuekffmtHZ91Of
         bzbwOhZzMvZgWYpD4ZtPGrQYGaeofGdsUEC7bDcBCcydMI7pW1D0SlNDM4QprOzQqCda
         fjZi6G+U5WlAn9ewj0JV6QC3H1TqRROP8lEBDwmgflJ9pALsFFblmJ62F15N4X6RVifk
         D47cIbZg1lOnn+PUfnFpTYotrkGXF6TssX4hXJeZckz3Il2arRvh7yCTdZACHha4HNgu
         BCbZzYucqhGdQnmARxPkizdVvvOBTI2YmMWgN63BVm4AVBTOITuSBoUxaSqnPp3niDcA
         Hvpg==
X-Forwarded-Encrypted: i=1; AL+hErHoIKfQfcQsHvLc28OEWhvD+gHCNS7Q/SVvnnKOBW+ZHr5q3HaBiOGzPIztUPls1grNO7mnJ35SB3qiMS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z807TRfpoWl9acsCS2CQM64KOV6ilWfqaDCGX/1Q5bPwMKRx1lU
	Lf4RH9cZdGSUZcGJc9FRR+oX3svNOta2C8wYg4yNr2692n2QIz+QZicA
X-Gm-Gg: AZFdTZdgQutsH56zA0Oato4Gth//qdNPJ/uNPjyOFy/uhXZ+gGHD97uRwuzRqafeWmh
	PKIkkDU2Wll0YzBJr7VaMEALPhbbsowvwrFChEZLmJ50YySasNMgVYENAsncXDdEk1oQW1U7QRb
	sShcxLwyVve5Tizm8uyjl6pNcF0B90l43Pgj0QgsH+gAZGNwD8EpRX0rcbZYZEs4DVdu3FGLQ82
	685jJrnjUNN1kz1IUvcbfH5Q6YmN3CGv7BH2JZ4OLHC7HzEVL8y4TtfTM/wQwayoiJLDIrp6Mur
	4BUSqB79r7ZSjCVVPZdhAw36gVOqOem5gMWg8/+CtTCV+JXQqPtNuLsXh7Pauiejpsrpi6xHYIf
	bfhTbtYhYvScVT2Cp1EYHZ7qsCp9FCJqP8Q4KGRb314hmaKOPJmHpjpd11V9A8ApQYNwNVvjuOB
	rMSY63dxkFGHohtGORbG95hodmE7SEAdikajkI5FTmneBEr89dAxX6M4MWgK34wPMNYFwQVz4hQ
	MjyRtf+nPJ16Ox8lI2Y3UTRjWyXlyuN6vVOH2NkZ82btHff+GDjCbbW+OyxYvnlrrcAmLFfW8Dx
	5dx1ATp6NUACO1z5B6S8BJsFe7pdUUOF6FgTuOw=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr398107485e9.13.1795626867730;
        Wed, 25 Nov 2026 09:14:27 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:11:8cbf:d366:a6fc:52dc:af7a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm244377725e9.3.2026.11.25.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:14:27 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip channel stats events
Date: Wed, 25 Nov 2026 18:13:29 +0100
Message-ID: <20261125171411.96431-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com> <20261121194939.3647400-2-morf3089@gmail.com> <CAFEp6-3cQBaC1Ob1B8v8ZmQcMd_KfyABXxV81M9u0RkBY=Z0Ng@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Loic,

On Wed, Nov 25, 2026 Loic Poulain wrote:
> Are we handling or using the CHAN_STAT_EVENT data in the driver? If
> so, which event handler or function currently consumes it?

Yes. With WMI_SCAN_CHAN_STAT_EVENT set, the firmware sends
WMI_TLV_CHAN_INFO_EVENTID for each scanned channel.
ath10k_wmi_event_chan_info() handles it and parses it with
ath10k_wmi_tlv_op_pull_ch_info_ev(). The default WCN3990
firmware-5.bin doesn't set single-chan-info-per-channel, so on SDM660
the event goes through ath10k_wmi_event_chan_info_paired(). That fills
ar->survey[] with noise floor, active time and busy time.

ath10k_get_survey() reports ar->survey[] to mac80211 for survey dump
and ACS.

With the bit set, survey data for scanned channels isn't populated on
these devices. I accept that to avoid the firmware crash on every scan.

Regards,
Gianluca
