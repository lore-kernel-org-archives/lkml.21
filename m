Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166062;
	b=Qi9NF4qxgkmUj8b89uCE4Dzg2hiAISFtuObggdftqgtndWrPsI/BPviaCPP8geyapEVf
	 IHUQPfVjxRRpd9yZQ5zzuvrOIyw1ac7SIIf5wmrHuzfs9P7K+hMZeH1qN5ediVlX9Dk9c
	 SbyPVddmMTS7onwgqRw7eG+Jn7zpdvRS1kHK1MCeesXZyLTC5omIzcUe89VCCLsh88O2z
	 oQWI3plFVocT74hm6Vj9zYeiIef+TYraeE/rY13ipCxRE86s2VDzJDz+id1DHH4r6ak1I
	 8G4nJds/fbqxiqfzYkXNDFMqzh9XODzItv4Jq5dLJ8ITa+pB1CzOWm1eSPf32HXnZkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166062;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=fawBJBxvqntIpfmYrM+MvGMXInte1Ysn4Da6nrX5kqg=;
	b=1/6j0VwnTDh7Gmxb40ik09ZXQxY8MJJo1ZGs5h7aubLmPxl9VDZAPXXL4UkE9MXgZZIZ
	 K2DjxQ/qGTxjb0dgbHSpFthVVP56wYFM/60ah7ddrfcvDljCO1My7+ZlNnjJ6ComefLWX
	 21/Ry7dFMHp75+vUbpvip5cPpcryqii23C64wulsUGZSM48We6qD6yMrBIXE8ex9bcZfe
	 hqQenDwkJJjhOHTda6JMrthIYCQutcF3TlbJ7OduEhSU+SzfWOIR9J1Qf6hLlQ/k9zfRe
	 CsuzHMRhpZxmaoGdnSfhH3LUsPP8SEBuvtAVIJi5CANjcfiC6pegJwH6opfs2jBdWVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDD5606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DDD5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpsz7t1795165966t49380da1
X-QQ-Originating-IP: RR10wvzWiKKffj+G7uXXMQNsGus0me5IDeSj1QwZdwg=
Received: from [10.20.30.2] ( [175.0.188.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Nov 2026 17:12:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6020361651217184553
Message-ID: <6ADB4C8146800DEE+635e4c74-fbd8-46bc-b1b7-670a35e62cb8@kylinsec.com.cn>
Date: Fri, 20 Nov 2026 17:10:58 +0800
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
Subject: Re: [PATCH] platform/loongarch: laptop: Fix backlight device lifetime
 on unload
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, Yao Zi <ziyao@disroot.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Zixing Liu <liushuyu@aosc.io>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <C3361EF435F90A22+20261119121937.2447021-1-luoqiu@kylinsec.com.cn>
 <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
Content-Language: en-US
From: Luo Qiu <luoqiu@kylinsec.com.cn>
In-Reply-To: <CAAhV-H7037=znoeU3+V086qGuDkRMVeSmt0PKe8DrdiFKcvF0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OYKM/pSuXZkt6mljoerFCnC7yAEcNQVDTVIeZicIC8cz+z7+iQ6OvGpt
	7Tz4f2/1N1vraHij7M6M/8vk3y2aUTzHILRR3C5cDj+sAfIkUTwaILXQJN4OFMsWNXw5sSD
	lGJgyKL4LEXjcRijhBD6LUGN8OtfKQo7whS9ejX8Zw3da4CkLk0llwZpzDxcxxH32ks2Ake
	A42hLRrrHBUMUQDNo/peAikh8GNsBZ3JWlv6dgO8ycO1bnS+6znQF90n+Ph7w5SpASyuAL7
	2tBaaGWU6bUebJkcJpavtZ5Wc/hqvaFGQo03vWmiaG5YZxmy64nNISrzHuJsglV3ycwer/b
	jxcG8mDgR+0yW9WaMBk9dFAG8oNy6Z1WbjbeESDOVnU9V1B6YGg3BmD+j6SeD3Z6xISmik5
	fQPmb1NcGhJaajwM6rOsSnieYQeTmyD66ewamX0j1c+RkLI7DYhcZWRknQh0LY6+h8vYnI1
	IpvjESFkrMmfD6Wwci5BQlcPH50MrhfJQ6gvqiVsziG8lAGVa6Ug3i/JhObdrri9SCvDV2B
	pXlSExW+VQVd60dl2owlQs9MVweU//C8RptDjS1Ol9UD79TtGgZ9l+L5uP37SBOLweRQWx8
	NJDZvafHtcZzJZMyksahHq4TUmtdBsYbq3fIb8fSIzQLdyYsPk9EoSfQwoZx4+DbfJp00ZS
	t4Wo5UOOMtiBxbZ/WaXPHPD81v62vnd4dZYOaWN60F3eI3YLxVMdrBFILPCPCL7iYc0qWBV
	z3LDprV7e7/1gcdASkxmBebeIJCEn5Saemgn0CVgM9Gvd90U2eK57Keo2Y9NWOXxUxthOSO
	5HO6qB+RznOyMOLpDOJ/VoWi90032BWUNp4T03+4f4Xs6IA4kO+OTvukgvQt8L6cXW3Yp9v
	OPaswAQhmFDj7ArgLU551ML8j3zWIbJiTheKTQHSoheXaJXM8bwBvC46S7iuKQ5+HdRswyg
	z03Se5A9M9kXOJ0PcbsBZQ7eoeM4ibMBs+vGNIf3u+IBpHR2PvJ/kT4W+c3oikwLxOu1wZ4
	7YI7qVdY2V1zZZp+9b0oFIdYo9c1LY+6/JsGC1zY+yjBtEuaxfze2ZPJLctnW/YgLMMxLBg
	dyDXM6mIJbL
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0


On 11/20/26 4:16 PM, Huacai Chen wrote:
> Hi, Qiu,
>
> On Thu, Nov 19, 2026 at 8:22 PM Luo Qiu <luoqiu@kylinsec.com.cn> wrote:
>> The driver registers a platform backlight device during module init but
>> discards the returned pointer. Consequently, the device is never
>> unregistered when the module is removed, leaving its ops callbacks
>> pointing into freed module text. After module removal, reading the
>> backlight's actual_brightness attribute can call the stale callback and
>> crash the kernel. Registration failures are also silently ignored.
>>
>> Store the returned pointer, use it for resume, and unregister it on
>> module exit. Propagate registration failures to avoid silently
>> continuing without a backlight device.
>>
>> Fixes: 6246ed09111f ("LoongArch: Add ACPI-based generic laptop driver")
>> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
>> ---
>>   drivers/platform/loongarch/loongson-laptop.c | 19 +++++++++++++------
>>   1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
>> index 4ec56621db24..ec0742e5ed46 100644
>> --- a/drivers/platform/loongarch/loongson-laptop.c
>> +++ b/drivers/platform/loongarch/loongson-laptop.c
>> @@ -56,6 +56,7 @@ static acpi_handle hotkey_handle;
>>   static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
>>
>>   static bool bl_powered;
>> +static struct backlight_device *backlight_dev;
>>   static int loongson_laptop_backlight_update(struct backlight_device *bd);
>>
>>   /* 2. ACPI Helpers and device model */
>> @@ -194,13 +195,12 @@ static int loongson_hotkey_resume(struct device *dev)
>>   {
>>          int status = 0;
>>          struct key_entry ke;
>> -       struct backlight_device *bd;
>>
>> -       bd = backlight_device_get_by_type(BACKLIGHT_PLATFORM);
>> -       if (bd) {
>> -               loongson_laptop_backlight_update(bd) ?
>> +       if (backlight_dev) {
>> +               loongson_laptop_backlight_update(backlight_dev) ?
>>                  pr_warn("Loongson_backlight: resume brightness failed") :
>> -               pr_info("Loongson_backlight: resume brightness %d\n", bd->props.brightness);
>> +               pr_info("Loongson_backlight: resume brightness %d\n",
>> +                               backlight_dev->props.brightness);
>>          }
>>
>>          /*
>> @@ -409,6 +409,7 @@ static int laptop_backlight_register(void)
>>   {
>>          int status = 0, ret;
>>          struct backlight_properties props;
>> +       struct backlight_device *bd;
>>
>>          memset(&props, 0, sizeof(props));
>>
>> @@ -426,9 +427,12 @@ static int laptop_backlight_register(void)
>>          props.power = BACKLIGHT_POWER_ON;
>>          props.type = BACKLIGHT_PLATFORM;
>>
>> -       backlight_device_register("loongson_laptop",
>> +       bd = backlight_device_register("loongson_laptop",
>>                                  NULL, NULL, &backlight_laptop_ops, &props);
>> +       if (IS_ERR(bd))
>> +               return PTR_ERR(bd);
>>
>> +       backlight_dev = bd;
>>
>>          return 0;
>>   }
>> @@ -622,6 +626,9 @@ static void __exit generic_acpi_laptop_exit(void)
>>                                  generic_subdriver_exit(&generic_sub_drivers[i]);
>>                  }
>>          }
>> +
>> +       backlight_device_unregister(backlight_dev);
> backlight_device_register is called conditionally but
> backlight_device_unregister() is called unconditionally, I think this
> is wrong.
>
> Huacai
Hi, Huacai.

Thanks for the review. The unconditional call is intentional and is safe

because backlight_device_unregister() explicitly accepts a NULL device:

     void backlight_device_unregister(struct backlight_device *bd)
     {
         if (!bd)
             return;
         ...
     }

backlight_dev is statically initialized to NULL. It is only assigned after
backlight_device_register() succeeds and the IS_ERR() check has passed. If
registration is skipped or fails, the pointer remains NULL, so the call in
the module exit path is a no-op rather than a NULL dereference.

I can change it to `if (backlight_dev) backlight_device_unregister(...)` in
a follow-up if you prefer that style.

Thanks.

Qiu Luo
>
>> +       backlight_dev = NULL;
>>   }
>>
>>   module_init(generic_acpi_laptop_init);
>> --
>> 2.56.1
>>

