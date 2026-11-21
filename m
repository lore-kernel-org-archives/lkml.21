Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795240984;
	b=EOVEDunoDEjFbhvw9Txiu/wBvePON/VLybQdM0aG94pDM5biuwj7sBgh9Ry9zu/9PbrC
	 broTkA5zZ/TOHWXlXr0t/4kTX1XeZcCBpxgSmIwnceWUKsel21AJOPqQX44wNUREBtxmN
	 FcCx7Wm5orJJnGrGAuYBnzsPKEBXPBwMO3oI+HcTLCq4sznuNHO1R8g5K1jMP49f2kDsQ
	 JXK7OxM/7I8n2aEN3ScARFE4XYnVe7nywLZ1vQA3unUcFecwOCAny5RGRz3MtkXhVGo88
	 j2tTQZ9tNGDoSqktiyq+7I4HiqsKImVWBIs8cmmUQQQpsPvF0+ni0n3hi5moMrntVQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795240984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iZeJgZydctjHQNPaqc1a3Pj1B2Wsau9GN69Um9z9RXU=;
	b=wXb9fxYYZl8UcQpJDpZH7bpsa9/XBgs4/2jcZ48sjovypAIhZOL/pdk7wBOwt9+V3tvo
	 0DoBNeEhRPd1BZQj8ky49+zA8+KhEu+aHmmcWSRMd+T5v8fb31HhnPVnnuKfaBtuX7KeP
	 es+L+f2XwrTW5s2zgJHUiW+V8USysZSQ6RW8VSgVVB6oCgbNVBshRH6c7d4dbUUeuMjZq
	 e+1sXT+zkNzE5XvzGYW5XiA2JNFIzdxvsUEQ2lehdZIxCyylJSJFrrGVx1ZseLSbyYEh0
	 mtOHqEDJDIgK93qKvojaJZ797Kq1X0a4PANvPg9qVgKH/KhsnObCAK3RSGmUq0hwnoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tU3Xrpc2;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27260606A68C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27260606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tU3Xrpc2
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so3044268eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795240983; x=1795845783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZeJgZydctjHQNPaqc1a3Pj1B2Wsau9GN69Um9z9RXU=;
        b=tU3Xrpc2LADNz5f7aWTNLpRvwQ/S9G5uLAp3npomNvo+t7Y4BfLZ/kEigevsB7WkYC
         gztEAJj8bvn/ZBg0SFLxAGC822obUtnaxOvWDwI5lfEUdn8+8j+Kzqywq6zQ8Uv1xR1z
         9vcKgvLUk1pY2fyWmHUY1+h/SOwaKUFFOYOQ4JLf/jKGNwPzmNXE2s9gijNwmN8ytvF0
         3omIwN9O/sZVP2gS4gQrwSjPXSJcr3oeORyNZP7hJeYGym8GNOVxLHeJM8g8RPw0oiLf
         eLM3TPSAoyoD8u5BDWZGmBnQp/WW9/hHtJDUAWOh9ntSpE9TUs8lY2c2nDF5EIsGmcGH
         4p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795240983; x=1795845783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZeJgZydctjHQNPaqc1a3Pj1B2Wsau9GN69Um9z9RXU=;
        b=ZiWOkiWKVvZXOQr8VRoaXsOdQXYJsTBfCe5UBx+xBVG8qyGI5YzAPveL8rP79ikkHT
         P1B9zumn5WHk+f+BdPBehfGKO5ywDgAvLVcwSikCRRYg3njLz7qkw+TJuDsEvjI++Vfa
         V7sJ0Hrsdylh22reiX6fGh8hLv4353tlX7l0t06bfELTviSmcLsKMaz80mBXZneC/peR
         1s2XWu8nfK4//NdUt0hV7BVkY7EolHUkCQoMt8imBRAfqTU+0OidwqFqpZdBFpyY5iaB
         FGY8uhj/MPoPPhGO+BybO9WTc8h0G7OxbudAq6cmWybtBo6vaR9AS4BXgMtGootCj/X9
         y0Mg==
X-Forwarded-Encrypted: i=1; AL+hErEO3S1ASUwBRTShE2NpZM+W1ca+7T5h03bMa6WaVhv7/EbLgEJzaS78C5T3EaWOjotYz0nZIppYBZ0XsP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z//khgvgDsg1aQLaswr9fq8IM0fBAgO5j4D2JBv59kK0zd7Nmpg
	h4iXbT4TqWfB9eoWvih89+5PsAMcHRtjPIGtQCksWFXU5UZhQbtGA+wj
X-Gm-Gg: AZFdTZdvbqQJdBjRpqosCKkxtsIoh7eJh1GYR0z6Z7ixwUzuAw0WlQmbeZr9iXIdHbO
	NpKx46gksutHMbXL17oYOceapyYPoqWfY1MNDJYFZP9vs0RV0uFTlykSd1WUU6xo6djr7B8e4DC
	kifazXeMVnVXycMeAi8MrPTEXNRmRZR+93o4mzq4MiGq7Ad62xUZnK/eeCsbNclGnyhAajs7qfT
	6ASRgbzhgaigYXWkg1UGqbd2lRd+LQFvh1NTlIuSCyx69YOVqKWLaKlZQAXfj2DrxABZkdEKQ/4
	R/9Vg9c0BmZtD3vib2cP1KQTVzOSUEfP33XE8oJsuJHin53eIb0/AUS28DY1BcEYw9N7UZDPcyt
	e/u0vgD1D/K3f5w/CEwYC50iBf7B+vIExhw/uiV2bbsrLXY+lttHSk5AnemlXdNVgfj6lblf+9+
	3h5pu/crspC+AmtOVD2TPxkAejKdCZLwcdONenqw4GczVakLEvE/Xl3Y57cz7/jXe6si7xMeGKU
	YRDxRo/HwbXNEvdO+9W8Vv9EH5r8CvnuK0Kt0xGj5JdmX2T7ZTf7p12Hjcsa1EkSk4/F8p3yuer
	4grDo4VnI/wVirgBKs5dX3bqh+OLLcoKvk1Z6yJEHsCuT7JsTbIHrcw/eZ98QU4wJ2c=
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr7522783eec.7.1795240982165;
        Fri, 20 Nov 2026 22:03:02 -0800 (PST)
Received: from eggarch ([2409:40c4:eb:2a8a:ac89:7bd3:9d62:35df])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm23226928eec.3.2026.11.20.22.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 22:03:01 -0800 (PST)
Date: Sat, 21 Nov 2026 11:32:54 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: synaptics - make InterTouch quirks table driven
Message-ID: <awEyv-5G0zfISfcJ@eggarch>
References: <20261105042614.688312-1-lovekeshsolanki00@gmail.com>
 <20261107020751.3959748-1-lovekeshsolanki00@gmail.com>
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
In-Reply-To: <20261107020751.3959748-1-lovekeshsolanki00@gmail.com>

Hey Dmitry,

Just following up on this patch, it moves the Intertouch quirk into a
dedicated table, to make it easier to exempt devices in the future.

Please let me know if there are any concerns or changes are needed.

Thanks,
Lovekesh
