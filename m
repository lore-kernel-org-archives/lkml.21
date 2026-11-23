Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433249;
	b=33LCswIGCfinDknH/QvBsCqS0azMalWj367RdsXvOjJYqml08IqmBC+U5brUZrLrePxm
	 2IwjK1IGKJQ6fwItCxzpP1BZfos202isS53VFBxNtN534yY+6d8Na/9HvPK8DlpAAQX8l
	 CriMUxW+B60iFurHFuaJ1GozXSdw5vQ0Z996BT3a1kuAbakK2f8gVymH09IOe2ERW2NEu
	 uRzWzCOSqAYNB7hnHHz5wvSVrpBTOWiV9wuE5+5b+PED68h/Z2CJSGzXUqpQ9HZyuBbJd
	 APW31F3wYqWKrSlnlNm+zqg4uK7gBGToNl8B8HL8UBFQyiMoM8wy1DEuaUSqxh73L2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
	b=LLmE+jSOtR5+8twC0qRbexlY1xl62B1qVORQl33x+/wDGTnfE640BL8gAYSfNXjfwL7Y
	 NsrDuqHQRtOMsmSqcgDbTltFeYxtQZRl8zZRgHqVWFSrbb3LKvmlZSwyzQoa522gsHmhx
	 5qLOsD/YZN39MU6sLQrDbtHukSj0lKNJVKcP9yLZ9Vmm23VkUbgjd+qITZUFQt7QKr9yR
	 kK1X1sHVTZEC3hDmMmRRogdxC6L5eT0Q7dTuprQ9sVlhvcVRyXISjjnn5HHLsxq7nMokv
	 /PxGwkgAxSCtBlhKr7v0uSm0oOAZKlmuTOJzfpkEQ7q8kHwB1oic+z9OgAdLy77UuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAySEIkE;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A580606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A580606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAySEIkE
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49a92144733so1487023f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433247; x=1796038047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
        b=ZAySEIkE61SkfF4pAwbFbxeQZEzLM6mFoV/OleA96jpiJX4Ny+kNOQILppSPnNMLnY
         hZMhUhe0p5CqZsewICIRtJu6hAum6xQ+HW8vWJnWzMZdO4lk7nYrjHBxBhgpQ7ob7ROP
         +C0NmrdhyJDZYg88as0TilMinT9IDRNK/NcLLFxbHYMQbRaZRdZFgOSgpPfc+eCFJM7M
         1l9cDxzbTh3Mg2TRa7EfTqt2GLQ+9ogUENdaf1/noFGxpVwf3X2kk7rb0tonQN3dW5tV
         RzMjmYy3tZZsWc2sXqaFXR4sPt9wui1k+DvVkQHbhj8LZkhk1GLehU2Yyq/F5Cjgw6iw
         FSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433247; x=1796038047;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7l6Yjh1JSeT2JRed35IiGX95vMbKdZloECt/CtA1YI=;
        b=210jKhm9LwZOsqUZB3e9ehzEeKcLj/xK/GK0CAcMkLKNujS34f7zFciCeRCQHgKJcY
         1ihsyM2JYA8Lntt0hdPM5eKw4Ckjua0Ykg+eTSyDzjNU3AGHPXVUDFai8oXIMpGD0CTw
         2EOdq6M/Q1YTyKiE+KJRlN8voH4n0hjPQ0dmLP1KZkUHpN5Cugwk5R1dzAq3LsS8Dm6g
         I33oEVhJYunZcPTxjXx9CW87YbHIKQ+BMXWtBTU/McOraAznST/wuGAcs+3iE58MKHZ/
         p0/zTdt4P1Z5ayrvDMdJS4TgivKaCnCW5E3C+0tNOcGT9YbANU8b+9FxR9bC4GVibapG
         WNXw==
X-Forwarded-Encrypted: i=1; AL+hErHDgK4yo7nKR2hnApHX/5YPBKfb5XaaY51b6UYWDjW5KJxtZb5flsJsp+38mygpkVoRtVFcuPkk/cJNe70=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dIzXNtg4HHH9o1CBNhbbiKoZMNZMlTJ9yzu4KvLxY7/vMdNmj
	YW+eh+/W3oFHSs7AHhYwZIaY6NaWp5ZCiP5hTcyQRD2wZ/WC5ob69sUL
X-Gm-Gg: AZFdTZczu/iEPzUEopl+wL7lXlCu5EZoz+cyaUoGrkXoytTyQQMblZEtTcaYZCWA5UJ
	E8rtrt7/+cJZ7kExlahU7FnPz+RiE4hG/5MG4TYanSKcKJJyShBVN9wslaR+WQhrPwApsgAvomw
	E9IgnHqdgESY3RNxUSwtDtjmph+xjE4wGI8aCHMQ19zpyqkxQPEJD8pSTT0NcrIetFRDWqxs21D
	sz6sDCQe3uirGUBfqZ0tG/ybHNgvgJ/cRvIiSwXuNafpyku02VzxveOc6t+IHlq9Jac+41RN7dc
	ZH0D6M/XNZm2ctV/TY2oVrfGR/cRrVCRU8sEVJuA3XpEAdIshREfSOhBmkkews+ryZd9yeQ/+9l
	bWh8tCkADtKKmgA3Ug397LBvP/GSH+3nb7uO96XJ3tgNjJbeF15X4v+COEN2qJnbYllfc4pPblp
	Z2kTKw8AKccXdPZNZdkRezKpOJGKpXF5p2ELdIRAdIup4sdML54iytX/PTJJG8dM+sHyfcHZ8ay
	7Ura8/nRlLKooAAeusMibnexcYobzbqeTaxR2BPbL1CGMBZmGIjj8e7JKH29VaziPK9QcylUbyE
	vggmU1AW0wBf2znmVvhmF6Bx9Dyr5MqXdbRXhKLm2QXQfR7PRIDtun3TiOnhIQEQM/gwXDtwpzi
	eK8KKq6CWZ0Wr8awzgpO+VOmd
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id 5b1f17b1804b1-4bb88944bf5mr221650055e9.35.1795433246798;
        Mon, 23 Nov 2026 03:27:26 -0800 (PST)
Received: from ?IPV6:240e:47e:509a:b87f:26b:b35a:8dbf:81dd? ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm336307275e9.5.2026.11.23.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:27:26 -0800 (PST)
Message-ID: <2f885fbf-1887-4740-a7ee-0189d74260a3@gmail.com>
Date: Mon, 23 Nov 2026 12:27:12 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: Re: [PATCH v6 02/43] drm/vkms: Lock the config dump against
 concurrent configfs changes
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Harry Wentland <harry.wentland@amd.com>,
 Lucas De Marchi <demarchi@kernel.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com,
 victoria@system76.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 llvm@lists.linux.dev
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
 <20261120-vkms-all-config-v6-2-78ace90f4fc1@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261120-vkms-all-config-v6-2-78ace90f4fc1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Louis,

 > The vkms_config debugfs dump iterates the configuration lists while
 > configfs can concurrently mutate or free them, which leads to a
 > use-after-free. Move the configuration lock into struct vkms_config and
 > run the dump under it.
 >
 > Fixes: 13fc9b9745cc ("drm/vkms: Add and remove VKMS instances via 
configfs")
 > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
 >
 > @@ -347,6 +349,14 @@ static int vkms_config_show(struct seq_file *m, 
void *data)
 >      struct vkms_config_crtc *crtc_cfg;
 >      struct vkms_config_encoder *encoder_cfg;
 >      struct vkms_config_connector *connector_cfg;
 > +    struct vkms_config *config = (struct vkms_config *)vkmsdev->config;
 > +
 > +    /*
 > +     * The configuration lists and fields are concurrently mutated by
 > +     * configfs (creation, removal, attribute stores); iterate under the
 > +     * configuration lock to keep the iteration coherent.
 > +     */
 > +    guard(mutex)(&config->lock);
 >
 > @@ -711,7 +709,7 @@ static ssize_t device_enabled_store(struct 
config_item *item, const char *page,
 >      if (kstrtobool(page, &enabled))
 >          return -EINVAL;
 >
 > -    scoped_guard(mutex, &dev->lock) {
 > +    scoped_guard(mutex, &dev->config->lock) {
 >          if (!dev->enabled && enabled) {
 >              if (!vkms_config_is_valid(dev->config))
 >                  return -EINVAL;

Now that the dump takes the same lock, holding it across
vkms_create()/vkms_destroy() closes a cycle. vkms_destroy() calls
drm_dev_unregister(), which removes the vkms_config debugfs file and
waits for its readers to drain, while a reader in vkms_config_show() is
waiting for that same lock:

     echo 0 > enabled : holds config->lock, waits for the debugfs readers
     cat vkms_config  : holds a debugfs read, waits for config->lock

Also, vkms_connector_detect() reads cfg->status without taking
config->lock, while connector_status_store() writes it under the lock
and still allows the write after the device is enabled. The kref in
detect only keeps the object alive, so these two are a data race on the
same field.

By the way, Fixes: 13fc9b9745cc looks wrong -- the device cannot be
enabled at that commit, 64229b846a7e looks like the first reachable
point.

Thanks,
Oarora Etimis

