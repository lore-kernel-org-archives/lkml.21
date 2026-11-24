Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485422;
	b=fMzhqtyel96xt0tzhGYad8lQkoY6NIhNHYHBN5Q2f2rBjvyVjRc9QUuNIMZKX0HthW30
	 OKl0oti4A9uP7+zeW23NofTZJcJqQ3sS9suzoCHt3dkrXnrRHNmvF1XBULWdY+sJ6uzFE
	 vinkz4vAdRzN8yA4XQYa2K637U11rE4AZkFmUm0KCZVLziRa0WH00vNNlsXlQE2UUe+GB
	 sh5qJgl3Ku/CWoFnDpIpbKYt1oez8CHWWpeF9nhQl/CTnpsBfWRqKhda46rLGVS/s0qTm
	 IrQ0WFRnAHpw4o11iCslbKhUWk82VNxq25V6fTgU1Jp9a2JGSFpNPusx0vudyN58/6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=/L8uXiaS6bmFC0qrn35Iu5qpKgrTHXQ2XkvCS11ygz0=;
	b=AO8iAlSct3CbLZEWXavGI2RyBWaq4vPmEGbSvI2G9duTTe1RHGRCXIOGrwRkKd/Y1MjK
	 cOMsX+O7FU7aEq93yvN4MSE1FhJPXdiGrw3eD6Q0t0WqrHRZVWkjt06xlPBqxJ3KkShxY
	 QBqGhJkf2LeuBB4lBm8qr8vu0zLNDDOYtj7tgle1a5L1c0KJffYp+sMqIlU5nSSdgePho
	 z6T+TQcvZu/LtvRBwoxPWBN/HacwnSS0A80mOVNOFBNDtDF0qV6OBAHkA0MKi6wI5rEGq
	 uzeFcDUwSAaJk7fbnrnVtz6cGu3xVtBqqlilmilI6tCE2gh39X5OMf0fEfJ92YkIE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZhSgvR9;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D30606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D30606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZhSgvR9
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4944a0eso2831524c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485421; x=1796090221; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/L8uXiaS6bmFC0qrn35Iu5qpKgrTHXQ2XkvCS11ygz0=;
        b=HZhSgvR92UVg9Gq6HWqTK1bfiQW+QTlzc2rF/HYUTdPNoZvqr10ACNdZxih9eThop9
         Whqq6Q4xUHj8EtouQFUvHGQPLYCk4ErdQXnKeV2Dx85saqW/mnNmsY0pj1GrYpAvbxJs
         zCiOYS3IPunuybgG+6XEBCsICaWsDckSZ8WqzSgY4EKkqQ3nGsZotVUrlw6RpdJ3IwLB
         IcVvPpJ6MCrB+DoBOa7HMARzplDr+2xsgkMu6R0dLGGnwk/GOHhVE2+R0khJGOAa+yZz
         Gi+IopmJbX+heqCxNBTSn3NMb7/Jo2ZaC0OfwKBOCcxffGA0igcZVxm4FA3vYSwLSV7A
         RYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485421; x=1796090221;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/L8uXiaS6bmFC0qrn35Iu5qpKgrTHXQ2XkvCS11ygz0=;
        b=nFeiL2RCXgUPru0f/L2/wSLl2KqJwzFc+FuKsvhSyiV7+4cTeZY0f98uGenyaxhTNc
         R59D0jIOM75cF1IiFbJ0bwGAnCKSOhX94xUisc2Q0BN0+UZNMrHUXmoDvNpeWVjkHWEA
         UDqNzLekK5enRlCRhXZ7yKR1wqBDwAwmrC1x/fVdGKxqs/AqmOJFkUrB/HbRio+KUftd
         bJCO+SKQ0KNtfJao3gtLem0JZ5zrRyhWIkGlziYFqPbWcN55W6D+qvD8/fL20BqhtKbX
         JwnDhc38B8Vlb2Tfuv0Ded6QltAlBuKNzwrAKx9byT7l/9N8XgAqi8KiSYdPzum4Tfie
         wTnQ==
X-Forwarded-Encrypted: i=1; AL+hErHwr8hGKiHb6mZKeX3pv9mHCIIHa2wQjm3dhWFJgrVWbR1iMgzLP8FabJZicr9RRs27aliJ6YCLwM3FXWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QtiChMrHs5AIOZ7z5Dme7Jh+6Le1tGRNm5oSafA6giXgHXpeE
	2DtYwx0a4cq4jvrO4OKF5/gtdnd7T5mIMp6rO3vml+SuK+cLpBnRKPdlcHX5wtLg
X-Gm-Gg: AZFdTZepCyOqcsu3HG2oZZdOGRGC3ywb/HXlN4ZUmPoilHwOW4IDNz+QlgGtIvTYsTb
	KcIc33e7hqrcl43UYgRgm38uKos8TIQUQJzWXp1OqZycqtUZTk6P6DZgsfla4V9atnH0upeTWoq
	1AZMwpEed/h2E/XcU7S+ENgBKBFm/6nvYWcQRnrM4Qa3TC6QebNUDGQHDSZ4djBeVgFVll1mTA9
	2pk3wviGCL8NUOlQPfs7VPJnyi5fYEpZiEBdI1GmR6n7cpYp19ojLv45RTzAUzxV10Sp4kHmiwi
	NK9SucnK7psWO1MghDWRxjnMIcJS+sZRfvE5C6sMcXvHE1KBXEdbIcmOe0vzgqb5XX1Eazx2nZK
	08oMI7l1F/etN7VG6AZ0NmE0wc4S3wvJBz/8FB0VWujryYhoB/nZD0JP0bG660ms7yOBZNGz5Kt
	NtrRju47OxPVUKNm6e5lRCztw6r+x/Am7EExuRWLD3dQCJF+Ta23cTLRlgxwtgdQjgQnGNnzhJf
	HUMcRmnkI/jUe12OiXEybUCamet9f9BB2Si2dAwNeWA+Vs5CYARkL3m6zBKNZbWbfAtnjmrYYOD
	15p1/eEMY24eKHwUB75wmTkybQ2OXlKTagAZZ6WfJztkWLcUKEwm+S3mf4CKDR5kEBTRCg==
X-Received: by 2002:a05:7022:6988:b0:156:6676:d0e2 with SMTP id a92af1059eb24-1b55689f5dbmr18451310c88.10.1795485420878;
        Mon, 23 Nov 2026 17:57:00 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm35459890c88.13.2026.11.23.17.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:57:00 -0800 (PST)
Date: Mon, 23 Nov 2026 17:56:59 -0800
Message-ID: <a4ffb45b13ddacd888f169eb9a60aa69@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: CJ <firefly0158@163.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb on v7.2-rc3
In-Reply-To: <4ffee3ca.5062.1a1c4325d29.Coremail.firefly0158@163.com>
References: <4ffee3ca.5062.1a1c4325d29.Coremail.firefly0158@163.com>
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

Hi CJ,

On Tue, Nov 10, 2026 at 02:43:17PM +0800, CJ wrote:
> syzbot reported "WARNING in cm109_urb_irq_callback/usb_submit_urb" on linux-5.15. The same failure is still reproducible on v7.2-rc3 with the reproducer below.

Thank you for the report. The obsolete cm109 driver is being removed
(queued in the input next branch for v7.5):

https://patch.msgid.link/20261112001642.243554-3-dmitry.torokhov@gmail.com

Thanks.

-- 
Dmitry
