Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676256;
	b=eIqFMNKsV29u65OnD3ldDnhlTNXb/pEsJbQTV8vRql8Y5eYUxpapNljd5kmVDBNSiwyV
	 XePvW6NpGpGTVqBXuAJRicBlyNtosAkuWQjZubKscGWLjIzQ16zvldeRuAW/r3O7UtzqB
	 2rnEnSoxuE+XKaV0dN6TJRVQ4YZE/MueZ+WtVRt0tRgEoJb3PSducPwsvrQjmbuafoyI3
	 FRFuIpdFsgq5SAvOcWFRQnncW/0w5+qnWZ01gpwL7ko4tiFX4Cuk2niaLfVtouB9AUlQQ
	 W0Qzb+tcle09Uo6QzmS72czTjn5HDuAnzgPX2L9GDQWa/0x5Uj9L1pgcQE1dGwZ79mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OV8ZfQ31h6oUU+BkfuJmbyYts6FR9jN//PpBfpjFjkk=;
	b=Y+mlc/gbGCKHhH+ZabRCXDxCBt84/dMAX42iieofdypLfVTvjLDPq5Y3KPm65q7VgLBb
	 3j5ymVsrdsL3fgUWV7vV5XMUnwUQOCZUPU78hVeSP9TF37xsjiM8tckM6UL1YQogRdZv/
	 8NAvjN19O7v8YHVgr7OR/8iGS6nuvrprp3nzbz5jxue9T9mUHeg0AmSWX9T5KWhXsnHeW
	 Bk43NPKq8P/r7R1EVEPIBxIqyNfCl8jtLWURMD12zcGtrB0yH7xiy/T4Cm7utVvQGcpVt
	 K/IJ5XQSQtyuSXUswaEjDqVuWRYKrllB73TkvS6qz/DWHMUUoub+rij2Arfj+Hz9ldg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLyPoQK0;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2610606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2610606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLyPoQK0
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so3831458f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676254; x=1796281054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OV8ZfQ31h6oUU+BkfuJmbyYts6FR9jN//PpBfpjFjkk=;
        b=aLyPoQK0rgpR69rohkQGgoN91aG2cqq3/YzzsIyl3nNXfp4bgeO601Kha158Zmd4HI
         9mhN3S8wvRa2qAX/TTvCznFco8BpKI13TH3n39U61wOC/Xd2iITSsdzaT4nu7r9EAUIG
         cuhsTECT52cfxSTYDbi/8kUeGwsBqX27CD7LXdjNLXFuIM9G9So+7Ktm2q8fSO4P0iQj
         sC1LBkT+pBw9TBdzUae6YA7k39kkPgtsEUZLwUaFnqxB7zJP+aMsap5JS+76NkloZTdb
         bAFSbRioJxtCA/QUp3VBsps63rgGUUGWzL4TaZdjerL94n5z2p3chZodizmU1A6Px957
         kCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676254; x=1796281054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OV8ZfQ31h6oUU+BkfuJmbyYts6FR9jN//PpBfpjFjkk=;
        b=EWTg2zikgQwuYpKc72CyfK5yy0uVfty6H1l4EfCb6HizjLi5dv5qNmVFBLXB9dD2PW
         1sQE+1LG8bqt5kmN6U2ySdC1jpBSCqS6SS1LTINMyRlFW6Jt1jgObzLOcnPN72xXdWtl
         /Mht7v7rSRYifc8MEsLcRa9qMgB8rnisXrgXi/4pvW+P/wyKPQi6wnHkwU9TN5G9PhqY
         iAIzgt+pIIMM3/LP/iQMXmg0lW9Az/gTZa7pgR4VuMvnnG/LXR8GXwYS2SnQIDDaVRSq
         KvII7lMtW6e6p+V4E4Hcf7a51oPxTO6H5cza4GqUqhN++kQ44FmaJYefPA7oRtWGxbt0
         sp2A==
X-Forwarded-Encrypted: i=1; AL+hErFLKbvIytkoBYkdJ0bs7yT3pvghPib22nDVXJz8p1PNEh0uvRgBy3e3bhUGPDwzN2gfJGDtPhkcE6MXQOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dw9BaHQ1J4kRXDQr/IWqKRPQtLztCCxw+zephjg3Aq8LAoup5
	EUu4lWcBXcZHnYexfZWBDT/UbTPBvak0UQIzjSxwVboE5oLbpbABoUuf
X-Gm-Gg: AZFdTZeC3IiqROHHoop7YmZzt9k9r6hUFsOfwp/jvXxp8AShL5slyogKpdw4ZUCO6PB
	TIlW+P/oohfF3L2yX5Ob0+HSXM+DubRDnpCPwPSFB6L6D2toKvkO5nEs8aMTZ4JLqhWkPeFIH7X
	Tcm3lSLN2eTN5lekXDCkVWy68vHcqShF3VltoWM1HV1H0nBDh4Xn08OJeso4YqQ39DMy8TnaRMQ
	IzB/W0FnKznJFvQ6aeSZlvOzjHtoedXvelTfchWX56dzKvAHAIxUbUA391XXLmhbcbAyE6hkd/4
	IKTP6Yzw6nZdg7tGrwkATG0O21BMiT3M0c5E8e/9JF5MPR8o3EwSNrOE9J554NxjsH62LLStEJq
	YV+C8nKybPNjf8Fk/oB/eeb9TLoFM/aD3TcB1sLW2hAzvj41jGPJEOvpPvhNgZ8Gr2oZLC1e11t
	bLoim2X9rCR7Crvaq0LpgsL71aDJjfmQo3e0Smcti9Dx8UlBgkTQQ2MtsdeHXLHUN9NgvxQ0KB2
	rcinTFhV8whyYzdTcH9jOwf5Habh3+3q1ZrNUyxQCyFEfPo7KcN6okSHHpOh2IWFFcAVBnAogOZ
	/o+4EfwJlc1V3alnnm7l/1gf6Q==
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr33965238f8f.40.1795676253907;
        Wed, 25 Nov 2026 22:57:33 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab658e2d55sm38636374f8f.5.2026.11.25.22.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:57:33 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: josef@toxicpanda.com
Cc: James.Bottomley@HansenPartnership.com,
	andrew@amutable.com,
	brauner@kernel.org,
	jbingham@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergeh@kernel.org,
	taherafahimi@linux.microsoft.com
Subject: Re: [PATCH RFC v3 02/90] Documentation: add examples for cells
Date: Thu, 26 Nov 2026 09:57:26 +0300
Message-ID: <20261126065726.2646029-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-cells-v3-2-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-2-bc9095937a84@toxicpanda.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Josef Bacik <josef@toxicpanda.com>:
> +   pidfd = pidfd_open(cfd, PIDFD_EMPTY);
> +   pidfd_configure(pidfd, PIDFD_SET_STRING, "exec", "/bin/convert", 0);
> +   pidfd_configure(pidfd, PIDFD_SET_BINARY, "argv", "convert\0-\0png:-", 16);
> +   pidfd_configure(pidfd, PIDFD_SET_FD, "0", NULL, in_fd);
> +   pidfd_configure(pidfd, PIDFD_SET_FD, "1", NULL, out_fd);
> +   pidfd_configure(pidfd, PIDFD_CMD_START, NULL, NULL, 0);
> +
> +   read(cfd, &status, sizeof(status));
> +
> +The ``ids`` slot was left empty, so this is a one-id cell.  A builder without privilege
> +does the mounting in a user and mount namespace of its own, since ``open_tree()`` with
> +``OPEN_TREE_CLONE`` takes ``CAP_SYS_ADMIN`` over the mount namespace of the caller.  The
> +cgroup has to be one that it owns and could move itself into, such as one that
> +``systemd --user`` has delegated to it.
> +
> +The new task has the three files it was given and no others.  There is nothing to close
> +and nothing to forget.

You gave the task 2 files, not 3 (in_fd and out_fd). This is obvious mistake.
(Text and code don't match.) Why LLM did not caught it?

Also, as previously, I still suggest to open fd 2 as /dev/null.




> +Binding the node of the host's ``/dev`` does not do it.

So host should actually create device using mknod? This will be problematic
in case of nested cells (i. e. if we ever will support nested cells.)


-- 
Askar Safin
