Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872263;
	b=LVpu+nAucLsNY3WHT/Wkx5uInxJ1lVpqTrOo0UW+iNBjLoNajdKH4TZARteCmZTY4ad7
	 6NA2E3jThffGyL4oM9vWFCFMbFqJ5ixP86JhkKo9tZDtjioh4PRlIG4pULn/hqGJ87kzY
	 PxwqAlO78wEU1X4Ljys9i/uQHIwbVnThQ5Xcwa7gvg/r/+YFH5+KB0EkcXWNNmTEttabh
	 qCw+HRYW9YIMRuPvHP9EAjii40/KOrBz/FXC6sjg29dCXSu1JoxnQI2vRG5Os4VQ7+nIk
	 h7RQJ4XqS65omlldK/k7nfRGbfK/3zi+bo8umy+EU3NFNOGsc5KZEUmv2hCL4DMfxQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872263;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=CAI2e3ZTbesnZxOiZ0jtrb62kTx8LFqit3eGNbnsYPE=;
	b=4j7GONcyZvA7m880eYWhuGbnqblsKa4YQU6HQ3pGZMNFBE46nzWlDLgYR5c2dH4p2v77
	 Ldll3GKjea/pT2JgoV/A4UTZQapy1DTwGbJLf7Y/AO7a4UD30Yh04TJ8M/C6dT1PTAw88
	 9wOcmV2j2I3M4nB8yP5w+X9yotWb//HDN2xn4syXVQGPJyi54NaEB9Loc3HcvHI8yvIOG
	 a2Fngh+mAbJp51/4+H8vMqtUwhVlK1ZwGhmSj7Jpj1vCDKEbHUJZ5IklQlHQnZPYYMyO4
	 DzxT3jhHeCThNT1jWPtSRCN7E8hItTI0crztNyOfxo60FBb4uNGUihT5tTzeV92DEYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=DS3W+R7i;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB6606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFB6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=DS3W+R7i
DKIM2-Signature:  i=1; m=1; t=1795872260;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:Pqn5xmd09G2Ab4xgaQZjgeyDCxca
   cP5gQvGSpqOnmG3NQkW4zHbP2y7usujD1gJvdd/2YNpJoR7n3CmjIawJrQjkxUvuMbNs1Vor9jK
   9xUUPaa76Puc5KejvLqp0LX81c0Or+Li1+jQsKnLP13W70Q0944o/WTtCtVq9IYCkqEoUuKV5Z+
   nslQtIgepJqEx+Sf61rqERoLQfp8cN3Urp6bO6niz6UE+y7dINS22XZ+nYstK3aKoSmBPGzCHCk
   b2C2gQQj4i+J9hsICLNyJpJxfnRqvv7cFNZ8HwBheEaeqdotFqqx+cqroxeO74dXVYceM2EGwwm
   05/GKlh7GvSrUA==;
Message-Instance:  m=1;
 h=sha256:
   Z/MtLbApC8Slwpx5xWaUfjrAOrLdunyRG04n+bp20Zw=:
   cBCt0Zt8sJu5F8KtO0YybGcyCPBN26CI2Ia7KdzKqck=,
  sha512:
   2zE1uv1D5OCXk0wTM52gSr2PGaP0kJC9zvUI4hrAjHNSuR7S+DLHtS1LEFaDwUGN96x5ZtJSSkFejJR7VHZFtw==:
   PhnJ1qAMYhO+93yx2oNP2DOQ0dRnVwmJg/lRH+bcg8vGXD4APM4LjBrTYPzL+PCnr5lj0EtfU4Pv93e6lKlw+w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795872251; x=1796477051; i=w_armin@gmx.de;
	bh=CAI2e3ZTbesnZxOiZ0jtrb62kTx8LFqit3eGNbnsYPE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DS3W+R7itCR8wM8G9DKROilk7JU03XskP6UwBQ904R6m68IXMA7LeuPA+qMS02zC
	 bfDNHdn1AUnnOulltMZShXxkg3zAdvFgp8073EAMEzC4BksROE12GULDRwlwpZU2d
	 PYIAy2MJne4f6s2l6QFTk8yn/Ca0p9HOm7uOEmeXNlK3MbBkEVR2SFowZMKVss+hN
	 FhWm/00mEP0LjjFAdc+c/JL7/fMPTBbuGaj8qJ3vVfmULKjcCctZFxQQx7T69rHlU
	 M/ZhvbM936KDKLyrGn5gsuoiSIj6KF6FNA53QaUA7bYe0sAzdOA4+2bKV20GQojaP
	 PA1A8EqfqmB4qFUmVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1yCRyT0Exe-00bmaB; Sat, 28
 Nov 2026 14:24:11 +0100
Message-ID: <1bb5237d-17ba-4c5b-8f9a-15f06eb3c09b@gmx.de>
Date: Sat, 28 Nov 2026 14:24:09 +0100
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
Subject: Re: [PATCH v3 08/11] leds: class: Split led_classdev_register_ext()
To: Lee Jones <lee@kernel.org>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, i@rong.moe
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-9-W_Armin@gmx.de>
 <179568576204.32537.4412828047245874349@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <179568576204.32537.4412828047245874349@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KY9BmXI/4QgwsvMsHNRbF+8ZtLGatDfaVcgILtLCpT5+wAytWS5
 dk5O18Dgv/fP0i05qNqC6ReTzmOiGMllsbPo96mJGhlE5DcnQzr/yTFSVU6E33ucRLP5erv
 Xhvs4PFWkQccnzLqculfT2TyjE4VFT20m3azwDICP7SlA4/cVH9CvZJvCWXdfr7UMQp2QM+
 9lT7TtrwNMgYZ16CXBzXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6nPnabyD94I=;k+fKyS+LDfrJkKhi3GLlZIv2z8j
 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

Am 27.11.26 um 15:42 schrieb Lee Jones:

> --- checkpatch.pl (4 issues) ---
> Line 149: ERROR: code indent should use tabs where possible
> Line 149: WARNING: please, no spaces at the start of a line
> Line 150: ERROR: code indent should use tabs where possible
> Line 150: WARNING: please, no spaces at the start of a line
> ----------------------------------
>
> ???

My bad, i forgot to reinstall my post-commit hook when cloning the kernel =
tree.

>> Split led_classdev_register_ext() into two separate internal functions
>> to prepare for future changes around LED class device initialization.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/leds/led-class.c | 102 ++++++++++++++++++++++++++++++++------=
-
>>   drivers/leds/leds.h      |   3 ++
>>   2 files changed, 87 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>> index 8494a1ca0353..2f62141268ab 100644
>> --- a/drivers/leds/led-class.c
>> +++ b/drivers/leds/led-class.c
>> @@ -253,9 +253,15 @@ static struct led_classdev *led_module_get(struct =
device *led_dev)
>>   	return led_cdev;
>>   }
>>
>> +static void led_classdev_release(struct device *dev)
>> +{
>> +	kfree(dev);
>> +}
>> +
>>   static const struct class leds_class =3D {
>>   	.name =3D "leds",
>>   	.dev_groups =3D led_groups,
>> +	.dev_release =3D led_classdev_release,
>>   	.pm =3D &leds_class_dev_pm_ops,
>>   };
>>
>> @@ -490,16 +496,19 @@ static int led_classdev_next_name(const char *ini=
t_name, char *name,
>>   }
>>
>>   /**
>> - * led_classdev_register_ext - register a new object of led_classdev c=
lass
>> - *			       with init data.
>> - *
>> - * @parent: parent of LED device
>> + * led_classdev_init - Initialize a new LED class device.
>> + * @parent: parent of LED device.
>>    * @led_cdev: the led_classdev structure for this device.
>> - * @init_data: LED class device initialization data
>> + * @init_data: LED class device initialization data.
>> + *
>> + * Initializes a new LED class device, but does not register with the
>> + * subsystem yet. Useful for performing additional initialization befo=
re
>> + * adding the LED class device to the subsystem using led_classdev_add=
().
>> + *
>> + * Return: Zero on success or a negative error code on failure.
>>    */
>> -int led_classdev_register_ext(struct device *parent,
>> -			      struct led_classdev *led_cdev,
>> -			      struct led_init_data *init_data)
>> +int led_classdev_init(struct device *parent, struct led_classdev *led_=
cdev,
>> +		      struct led_init_data *init_data)
>>   {
>>   	char composed_name[LED_MAX_NAME_SIZE];
>>   	char final_name[LED_MAX_NAME_SIZE];
>> @@ -564,12 +573,52 @@ int led_classdev_register_ext(struct device *pare=
nt,
>>   	if (!led_cdev->max_brightness)
>>   		led_cdev->max_brightness =3D LED_FULL;
>>
>> +	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
>> +	if (!led_cdev->dev)
>> +		return -ENOMEM;
>> +
>> +	device_initialize(led_cdev->dev);
>> +	led_cdev->dev->class =3D &leds_class;
>> +	led_cdev->dev->parent =3D parent;
>> +	led_cdev->dev->groups =3D led_cdev->groups;
>> +	dev_set_drvdata(led_cdev->dev, led_cdev);
>> +	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
>> +	if (ret) {
>> +		put_device(led_cdev->dev);
>> +		led_cdev->dev =3D NULL;
>> +		return ret;
>> +	}
>> +
>> +	led_cdev->wq =3D leds_wq;
>> +
>> +	led_init_core(led_cdev);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_init);
>> +
>> +/**
>> + * led_classdev_add - Add a new LED class device to the subsystem.
>> + * @led_cdev: the led_classdev structure for this device.
>> + * @init_data: LED class device initialization data.
>> + *
>> + * Adds a new LED class device to the subsystem, allowing userspace ap=
plications
>> + * and/or kernel consumers to access it.
>> + *
>> + * Returns: Zero on success or a negative error code on failure.
>> + */
>> +int led_classdev_add(struct led_classdev *led_cdev, struct led_init_da=
ta *init_data)
>> +{
>> +	int ret;
>> +
>>   	mutex_lock(&led_cdev->led_access);
>> -	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
>> -						  led_cdev, led_cdev->groups, "%s", final_name);
>> -	if (IS_ERR(led_cdev->dev)) {
>> +
>> +	ret =3D device_add(led_cdev->dev);
>> +	if (ret < 0) {
> Does (ret) work for this?

I believe so.

Thanks,
Armin Wolf

>>   		mutex_unlock(&led_cdev->led_access);
>> -		return PTR_ERR(led_cdev->dev);
>> +		put_device(led_cdev->dev);
>> +		led_cdev->dev =3D NULL;
>> +		return ret;
>>   	}
>>
>>   	if (init_data && init_data->fwnode)
>> @@ -588,10 +637,6 @@ int led_classdev_register_ext(struct device *paren=
t,
>>
>>   	led_update_brightness(led_cdev);
>>
>> -	led_cdev->wq =3D leds_wq;
>> -
>> -	led_init_core(led_cdev);
>> -
>>   	/* add to the list of leds */
>>   	down_write(&leds_list_lock);
>>   	list_add_tail(&led_cdev->node, &leds_list);
>> @@ -603,11 +648,32 @@ int led_classdev_register_ext(struct device *pare=
nt,
>>
>>   	mutex_unlock(&led_cdev->led_access);
>>
>> -	dev_dbg(parent, "Registered led device: %s\n",
>> -			led_cdev->name);
>> +	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cde=
v->name);
>>
>>   	return 0;
>>   }
>> +EXPORT_SYMBOL_GPL(led_classdev_add);
>> +
>> +/**
>> + * led_classdev_register_ext - register a new object of led_classdev c=
lass
>> + *                             with init data.
>> + *
>> + * @parent: parent of LED device.
>> + * @led_cdev: the led_classdev structure for this device.
>> + * @init_data: LED class device initialization data.
>> + */
>> +int led_classdev_register_ext(struct device *parent,
>> +                              struct led_classdev *led_cdev,
>> +                              struct led_init_data *init_data)
>> +{
>> +	int ret;
>> +
>> +	ret =3D led_classdev_init(parent, led_cdev, init_data);
>> +	if (ret < 0)
> if (ret)
>
> ?
>
>> +		return ret;
>> +
>> +	return led_classdev_add(led_cdev, init_data);
>> +}
>>   EXPORT_SYMBOL_GPL(led_classdev_register_ext);
>>
>>   /**
>> diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
>> index 6d00e6f44126..def7166f062a 100644
>> --- a/drivers/leds/leds.h
>> +++ b/drivers/leds/leds.h
>> @@ -18,6 +18,9 @@ static inline int led_get_brightness(struct led_class=
dev *led_cdev)
>>   }
>>
>>   void led_init_core(struct led_classdev *led_cdev);
>> +int led_classdev_init(struct device *parent, struct led_classdev *led_=
cdev,
>> +		      struct led_init_data *init_data);
>> +int led_classdev_add(struct led_classdev *led_cdev, struct led_init_da=
ta *init_data);
>>   void led_stop_software_blink(struct led_classdev *led_cdev);
>>   void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned =
int value);
>>   void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsign=
ed int value);
>> --=20
>> 2.56.1
>>
